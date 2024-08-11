import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';

class SaveUserAccessTokenUsecase {
  final UserAccessTokenRepositoryInterface _userAccessTokenRepositoryInterface;

  SaveUserAccessTokenUsecase(this._userAccessTokenRepositoryInterface);

  Future<void> execute(UserAccessToken token) async {
    await _userAccessTokenRepositoryInterface.save(token);
  }
}
