import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info_repository_interface.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';

class GetUserInfoUsecase {
  final UserInfoRepositoryInterface _userInfoRepositoryInterface;
  final _sharedPreferences = SharedPreferences();

  GetUserInfoUsecase(this._userInfoRepositoryInterface);

  Future<UserInfo> execute() async {
    final token = _sharedPreferences.getUserAccessToken();
    if (token == null) throw Exception('Token is not found');
    final userInfo = await _userInfoRepositoryInterface.fetch(UserAccessToken(token));
    return userInfo;
  }
}
