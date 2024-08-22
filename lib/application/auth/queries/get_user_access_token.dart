import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';

class GetUserAccessTokenUsecase {
  final UserAccessTokenRepositoryInterface _userAccessTokenRepositoryInterface;

  GetUserAccessTokenUsecase(this._userAccessTokenRepositoryInterface);

  Future<(UserAccessToken, RefreshToken)> execute(String code, String codeVerifier) async {
    final tokens = await _userAccessTokenRepositoryInterface.fetch(code, codeVerifier);
    return tokens;
  }
}
