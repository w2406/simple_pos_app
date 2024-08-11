import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';
import 'package:simple_pos_app/infrastructure/api/api_client.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';

class UserAccessTokenRepository implements UserAccessTokenRepositoryInterface {
  final ApiClient _apiClient;
  final SharedPreferences _sharedPreferences = SharedPreferences();

  UserAccessTokenRepository(this._apiClient);
  @override
  Future<UserAccessToken> fetch(String code, String codeVerifier) async {
    // base64エンコード
    String encoded = base64Encode(utf8.encode('${dotenv.env['client_id']}:${dotenv.env['client_secret']}'));

    PostUserAccessTokenResponse token;

    try {
      token = await _apiClient.postAccessToken(
        'Basic $encoded',
        'authorization_code',
        code,
        dotenv.env['redirect_uri'],
        codeVerifier,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
    return UserAccessToken(token.access_token);
  }

  @override
  Future<void> save(UserAccessToken token) async {
    // shared_preferencesに保存
    await _sharedPreferences.setUserAccessToken(token.value);
  }

  @override
  Future<UserAccessToken?> get() async {
    // shared_preferencesから取得
    final token = _sharedPreferences.getUserAccessToken();
    final local = token;
    return local == null ? null : UserAccessToken(local);
  }
}
