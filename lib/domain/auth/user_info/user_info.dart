import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../.generated/domain/auth/user_info/user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String sub,
    required Contract contract,
    required String name,
    required String email,
    required bool email_verified,
  }) = _UserInfo;
}

@freezed
class Contract with _$Contract {
  const factory Contract({
    required String id,
    required String user_id,
    required bool is_owner,
  }) = _Contract;
}
