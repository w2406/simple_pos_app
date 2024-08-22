import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';
import 'package:simple_pos_app/infrastructure/api/api_client.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_access_token/post_user_access_token_response.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_access_token_update/post_user_access_token_update_response.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';

class UserAccessTokenRepository implements UserAccessTokenRepositoryInterface {
  final ApiClient _apiClient;
  final SharedPreferences _sharedPreferences = SharedPreferences();

  // base64エンコード
  final _authorization =
      'Basic ${base64Encode(utf8.encode('${dotenv.env['client_id']}:${dotenv.env['client_secret']}'))}';

  UserAccessTokenRepository(this._apiClient);
  @override
  Future<(UserAccessToken, RefreshToken)> fetch(String code, String codeVerifier) async {
    PostUserAccessTokenResponse response;

    try {
      response = await _apiClient.postAccessToken(
        _authorization,
        'authorization_code',
        code,
        dotenv.env['redirect_uri'],
        codeVerifier,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
    return (
      UserAccessToken(response.access_token, response.expires_in, DateTime.now()),
      RefreshToken(response.refresh_token)
    );
  }

  @override
  Future<UserAccessToken> update(String refreshToken) async {
    PostUserAccessTokenUpdateResponse response;

    try {
      response = await _apiClient.postAccessTokenUpdate(
        _authorization,
        'refresh_token',
        refreshToken,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
    return UserAccessToken(response.access_token, response.expires_in, DateTime.now());
  }

  @override
  Future<void> save(UserAccessToken userAccessToken) async {
    // shared_preferencesに保存
    await _sharedPreferences.setUserAccessToken(userAccessToken.token);
    await _sharedPreferences.setUserAccessTokenExpiresIn(userAccessToken.expiresIn);
    await _sharedPreferences
        .setUserAccessTokenCreatedAtMillisecondsSinceEpoch(userAccessToken.createdAt.millisecondsSinceEpoch);
  }

  @override
  Future<UserAccessToken> get() async {
    final sharedPreferences = SharedPreferences();
    final userAccessToken = sharedPreferences.getUserAccessToken();
    final expiresIn = sharedPreferences.getUserAccessTokenExpiresIn();
    final createdAt = sharedPreferences.getUserAccessTokenCreatedAtMillisecondsSinceEpoch();
    if (userAccessToken == null) throw Exception('User access token not found');
    if (expiresIn == null) throw Exception('User access token expires in not found');
    if (createdAt == null) throw Exception('User access token created at not found');

    final token = UserAccessToken(userAccessToken, expiresIn, DateTime.fromMillisecondsSinceEpoch(createdAt));

    // ユーザーアクセストークンの期限が切れていたら、リフレッシュトークンを使用して更新する
    // TODO 更新処理を分離する
    if (!token.isValid()) {
      final refreshToken = sharedPreferences.getRefreshToken();
      if (refreshToken == null) throw Exception('Refresh token not found');
      return UserAccessTokenRepository(_apiClient).update(refreshToken);
    }

    // リフレッシュトークンが期限切れだった場合は、ユーザーアクセストークンとリフレッシュトークンを削除する
    // TODO ログイン画面に遷移する
    // TODO 実装する

    return token;
  }
}
