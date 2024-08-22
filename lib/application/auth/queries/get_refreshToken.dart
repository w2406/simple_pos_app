import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token_repository_interface.dart';

class GetRefreshTokenUsecase {
  final RefreshTokenRepositoryInterface _refreshTokenRepositoryInterface;

  GetRefreshTokenUsecase(this._refreshTokenRepositoryInterface);

  Future<RefreshToken> execute() async {
    final token = await _refreshTokenRepositoryInterface.get();
    if (token == null) throw Exception('Refresh token not found');
    return token;
  }
}
