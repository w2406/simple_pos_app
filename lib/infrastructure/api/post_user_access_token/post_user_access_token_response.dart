import 'package:json_annotation/json_annotation.dart';

part '../../../.generated/infrastructure/api/post_user_access_token/post_user_access_token_response.g.dart';

@JsonSerializable()
class PostUserAccessTokenResponse {
  factory PostUserAccessTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$PostUserAccessTokenResponseFromJson(json);

  final String token_type;
  final int expires_in;
  final String access_token;
  final String scope;
  final String id_token;
  final String refresh_token;

  const PostUserAccessTokenResponse(
      {required this.token_type,
      required this.expires_in,
      required this.access_token,
      required this.scope,
      required this.id_token,
      required this.refresh_token});

  Map<String, dynamic> toJson() => _$PostUserAccessTokenResponseToJson(this);
}
