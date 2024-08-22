import 'package:simple_pos_app/domain/auth/user_info/user_info.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info_repository_interface.dart';

class GetUserInfoUsecase {
  final UserInfoRepositoryInterface _userInfoRepositoryInterface;

  GetUserInfoUsecase(this._userInfoRepositoryInterface);

  Future<UserInfo> execute() async {
    final userInfo = await _userInfoRepositoryInterface.fetch();
    return userInfo;
  }
}
