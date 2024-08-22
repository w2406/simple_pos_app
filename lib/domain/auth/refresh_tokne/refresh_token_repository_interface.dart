import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';

abstract interface class RefreshTokenRepositoryInterface {
  Future<void> save(RefreshToken refreshToken);
  Future<RefreshToken?> get();
}
