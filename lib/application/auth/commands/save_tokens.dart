import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token_repository_interface.dart';

class SaveTokensUsecase {
  final UserAccessTokenRepositoryInterface _userAccessTokenRepositoryInterface;
  final RefreshTokenRepositoryInterface _refreshTokenRepositoryInterface;

  SaveTokensUsecase(this._userAccessTokenRepositoryInterface, this._refreshTokenRepositoryInterface);

  Future<void> execute(UserAccessToken userAccessToken, RefreshToken refreshToken) async {
    await _userAccessTokenRepositoryInterface.save(userAccessToken);
    await _refreshTokenRepositoryInterface.save(refreshToken);
  }
}
