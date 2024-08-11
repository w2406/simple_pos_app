import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';

class SaveUserAccessToken {
  final UserAccessTokenRepositoryInterface _userAccessTokenRepositoryInterface;

  SaveUserAccessToken(this._userAccessTokenRepositoryInterface);

  Future<void> execute(UserAccessToken token) async {
    await _userAccessTokenRepositoryInterface.save(token);
  }
}
