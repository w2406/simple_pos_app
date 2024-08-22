import 'package:simple_pos_app/domain/auth/user_info/user_info.dart' as domain;
import 'package:simple_pos_app/domain/auth/user_info/user_info_repository_interface.dart';
import 'package:simple_pos_app/infrastructure/api/api_client.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_info/post_user_info_response.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';
import 'package:simple_pos_app/infrastructure/repositories/auth/user_access_token_repository.dart';

class UserInfoRepository implements UserInfoRepositoryInterface {
  final ApiClient _apiClient;
  final UserAccessTokenRepository _userAccessTokenRepository;
  final SharedPreferences sharedPreferences = SharedPreferences();

  UserInfoRepository(this._apiClient, this._userAccessTokenRepository);

  @override
  Future<domain.UserInfo> fetch() async {
    PostUserInfoResponse userInfo;
    try {
      final token = await _userAccessTokenRepository.get();
      userInfo = await _apiClient.postUserInfo('Bearer ${token.token}');
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
