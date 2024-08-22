import 'package:json_annotation/json_annotation.dart';

part '../../../.generated/infrastructure/api/post_user_access_token_update/post_user_access_token_update_response.g.dart';

@JsonSerializable()
class PostUserAccessTokenUpdateResponse {
  factory PostUserAccessTokenUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$PostUserAccessTokenUpdateResponseFromJson(json);

  final String token_type;
  final int expires_in;
  final String access_token;
  final String scope;
  final String id_token;
  final String refresh_token;

  const PostUserAccessTokenUpdateResponse(
      {required this.token_type,
      required this.expires_in,
      required this.access_token,
      required this.scope,
      required this.id_token,
      required this.refresh_token});

  Map<String, dynamic> toJson() => _$PostUserAccessTokenUpdateResponseToJson(this);
}
