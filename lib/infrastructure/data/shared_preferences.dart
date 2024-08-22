import 'package:shared_preferences/shared_preferences.dart' as original;

class SharedPreferences {
  static SharedPreferences? _instance;

  final original.SharedPreferences _preferences;

  SharedPreferences._(this._preferences);

  static Future<void> initialize() async {
    if (_instance != null) return;
    final preferences = await original.SharedPreferences.getInstance();

    final instance = SharedPreferences._(preferences);
    _instance = instance;
  }

  factory SharedPreferences() {
    final local = _instance;
    if (local == null) throw Exception('SharedPreferences is not initialized');
    local._preferences.reload();
    return local;
  }
}

extension SharedPreferencesExtension on SharedPreferences {
  static const _userAccessToken = 'user_access_token';
  static const _userAccessTokenExpiresIn = 'user_access_token_expires_in';
  static const _userAccessTokenCreatedAt = 'user_access_token_created_at';
  static const _refreshToken = 'refresh_token';

  Future<void> setUserAccessToken(String token) async => await _preferences.setString(_userAccessToken, token);
  Future<void> setRefreshToken(String token) async => await _preferences.setString(_refreshToken, token);
  Future<void> setUserAccessTokenExpiresIn(int expiresIn) async =>
      await _preferences.setInt(_userAccessTokenExpiresIn, expiresIn);
  Future<void> setUserAccessTokenCreatedAtMillisecondsSinceEpoch(int createdAtMillisecondsSinceEpoch) async =>
      await _preferences.setInt(_userAccessTokenCreatedAt, createdAtMillisecondsSinceEpoch);

  Future<void> deleteUserAccessToken() async => await _preferences.remove(_userAccessToken);
  Future<void> deleteRefreshToken() async => await _preferences.remove(_refreshToken);
  Future<void> deleteUserAccessTokenExpiresIn() async => await _preferences.remove(_userAccessTokenExpiresIn);
  Future<void> deleteUserAccessTokenCreatedAtMillisecondsSinceEpoch() async =>
      await _preferences.remove(_userAccessTokenCreatedAt);

  String? getUserAccessToken() => _preferences.getString(_userAccessToken);
  String? getRefreshToken() => _preferences.getString(_refreshToken);
  int? getUserAccessTokenExpiresIn() => _preferences.getInt(_userAccessTokenExpiresIn);
  int? getUserAccessTokenCreatedAtMillisecondsSinceEpoch() => _preferences.getInt(_userAccessTokenCreatedAt);
}
