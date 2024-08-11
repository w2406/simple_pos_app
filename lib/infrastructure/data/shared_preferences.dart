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
  Future<void> setUserAccessToken(String token) async => await _preferences.setString(_userAccessToken, token);
  Future<void> deleteUserAccessToken() async => await _preferences.remove(_userAccessToken);
  String? getUserAccessToken() => _preferences.getString(_userAccessToken);
}
