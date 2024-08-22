import 'package:json_annotation/json_annotation.dart';

part '../../../.generated/infrastructure/api/post_user_info/post_user_info_response.g.dart';

@JsonSerializable()
class PostUserInfoResponse {
  factory PostUserInfoResponse.fromJson(Map<String, dynamic> json) => _$PostUserInfoResponseFromJson(json);

  final String sub;
  final Contract contract;
  final String name;
  final String email;
  final bool email_verified;

  PostUserInfoResponse(
      {required this.sub,
      required this.contract,
      required this.name,
      required this.email,
      required this.email_verified});

  Map<String, dynamic> toJson() => _$PostUserInfoResponseToJson(this);
}

@JsonSerializable()
class Contract {
  factory Contract.fromJson(Map<String, dynamic> json) => _$ContractFromJson(json);

  final String id;
  final String user_id;
  final bool is_owner;

  Contract({required this.id, required this.user_id, required this.is_owner});

  Map<String, dynamic> toJson() => _$ContractToJson(this);
}
