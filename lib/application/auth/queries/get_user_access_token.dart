import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';

class GetUserAccessTokenUsecase {
  final UserAccessTokenRepositoryInterface _userAccessTokenRepositoryInterface;

  GetUserAccessTokenUsecase(this._userAccessTokenRepositoryInterface);

  Future<UserAccessToken> execute(String code, String codeVerifier) async {
    final token = await _userAccessTokenRepositoryInterface.fetch(code, codeVerifier);
    return token;
  }
}
