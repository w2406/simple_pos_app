import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info.dart';

abstract interface class UserInfoRepositoryInterface {
  Future<UserInfo> fetch(UserAccessToken token);
}
