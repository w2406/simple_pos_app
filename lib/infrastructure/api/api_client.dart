import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_access_token/post_user_access_token_response.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_access_token_update/post_user_access_token_update_response.dart';
import 'package:simple_pos_app/infrastructure/api/post_user_info/post_user_info_response.dart';

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

  // ユーザーアクセストークン更新時はリクエストボディが違うため、別メソッドとして定義
  @POST('/authorize/token')
  Future<PostUserAccessTokenUpdateResponse> postAccessTokenUpdate(
    @Header('Authorization') String authorization,
    @Field('grant_type') String grantType,
    @Field('refresh_token') String refreshToken,
  );

  @POST('/userinfo')
  Future<PostUserInfoResponse> postUserInfo(
    @Header('Authorization') String authorization,
  );
}
