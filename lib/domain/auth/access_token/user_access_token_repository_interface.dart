import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';

abstract interface class UserAccessTokenRepositoryInterface {
  Future<UserAccessToken> fetch(String code, String codeVerifier);
  Future<void> save(UserAccessToken token);
  Future<UserAccessToken?> get();
}
