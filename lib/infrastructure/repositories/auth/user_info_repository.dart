import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info.dart' as domain;
import 'package:simple_pos_app/domain/auth/user_info/user_info_repository_interface.dart';
import 'package:simple_pos_app/infrastructure/api/api_client.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';

class UserInfoRepository implements UserInfoRepositoryInterface {
  final ApiClient _apiClient;
  final SharedPreferences sharedPreferences = SharedPreferences();

  UserInfoRepository(this._apiClient);

  @override
  Future<domain.UserInfo> fetch(UserAccessToken token) async {
    PostUserInfoResponse userInfo;
    try {
      userInfo = await _apiClient.postUserInfo('Bearer ${token.value}');
    } catch (e) {
      print(e);
      rethrow;
    }
    return domain.UserInfo(
      sub: userInfo.sub,
      contract: domain.Contract(
        id: userInfo.contract.id,
        user_id: userInfo.contract.user_id,
        is_owner: userInfo.contract.is_owner,
      ),
      name: userInfo.name,
      email: userInfo.email,
      email_verified: userInfo.email_verified,
    );
  }
}
