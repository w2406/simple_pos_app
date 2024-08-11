import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part '../../.generated/infrastructure/api/api_client.g.dart';

@RestApi(baseUrl: 'https://id.smaregi.jp')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/authorize/token')
  @Headers({'Content-Type': 'application/x-www-form-urlencoded'})
  Future<PostAccessTokenResponse> postAccessToken(
    @Header('Authorization') String authorization,
    @Field('grant_type') String grantType,
    @Field('code') String code,
    @Field('redirect_uri') String? redirectUri,
    @Field('code_verifier') String? codeVerifier,
  );
}

@JsonSerializable()
class PostAccessTokenResponse {
  factory PostAccessTokenResponse.fromJson(Map<String, dynamic> json) => _$PostAccessTokenResponseFromJson(json);

  final String token_type;
  final int expires_in;
  final String access_token;
  final String scope;
  final String id_token;
  final String refresh_token;

  const PostAccessTokenResponse(
      {required this.token_type,
      required this.expires_in,
      required this.access_token,
      required this.scope,
      required this.id_token,
      required this.refresh_token});

  Map<String, dynamic> toJson() => _$PostAccessTokenResponseToJson(this);
}
