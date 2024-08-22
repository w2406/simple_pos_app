import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';

abstract interface class UserAccessTokenRepositoryInterface {
  Future<(UserAccessToken, RefreshToken)> fetch(String code, String codeVerifier);
  Future<UserAccessToken> update(String refreshToken);
  Future<void> save(UserAccessToken userAccessToken);
  Future<UserAccessToken> get();
}
