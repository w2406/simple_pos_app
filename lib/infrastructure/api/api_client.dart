import 'package:dio/dio.dart' hide Headers;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part '../../.generated/infrastructure/api/api_client.g.dart';

@RestApi(baseUrl: 'https://id.smaregi.jp')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST('/authorize/token')
  @Headers({'Content-Type': 'application/x-www-form-urlencoded'})
  Future<PostUserAccessTokenResponse> postAccessToken(
    @Header('Authorization') String authorization,
    @Field('grant_type') String grantType,
    @Field('code') String code,
    @Field('redirect_uri') String? redirectUri,
    @Field('code_verifier') String? codeVerifier,
  );

  @POST('/userinfo')
  Future<PostUserInfoResponse> postUserInfo(
    @Header('Authorization') String authorization,
  );
}

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
