import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token.dart';
import 'package:simple_pos_app/domain/auth/refresh_tokne/refresh_token_repository_interface.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';

class RefreshTokenRepository implements RefreshTokenRepositoryInterface {
  final sharedPreferences = SharedPreferences();
  @override
  Future<void> save(RefreshToken refreshToken) async {
    // shared_preferencesに保存
    await sharedPreferences.setRefreshToken(refreshToken.value);
  }

  @override
  Future<RefreshToken?> get() async {
    // shared_preferencesから取得
    final refreshToken = sharedPreferences.getRefreshToken();
    return refreshToken == null ? null : RefreshToken(refreshToken);
  }
}
