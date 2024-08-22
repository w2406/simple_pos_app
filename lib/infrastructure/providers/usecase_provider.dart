import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/application/auth/commands/save_tokens.dart';
import 'package:simple_pos_app/application/auth/queries/get_authorization_code.dart';
import 'package:simple_pos_app/application/auth/queries/get_refreshToken.dart';
import 'package:simple_pos_app/application/auth/queries/get_user_access_token.dart';
import 'package:simple_pos_app/application/auth/queries/get_user_info.dart';
import 'package:simple_pos_app/infrastructure/providers/repository_provider.dart';

part '../../.generated/infrastructure/providers/usecase_provider.g.dart';

// usecaseを提供するProvider

@Riverpod(keepAlive: true)
GetAuthorizationCodeUsecase getAuthorizationCodeUsecase(GetAuthorizationCodeUsecaseRef ref) =>
    GetAuthorizationCodeUsecase();

@Riverpod(keepAlive: true)
GetUserAccessTokenUsecase getUserAccessTokenUsecase(GetUserAccessTokenUsecaseRef ref) =>
    GetUserAccessTokenUsecase(ref.read(userAccessTokenRepositoryProvider));

@Riverpod(keepAlive: true)
GetRefreshTokenUsecase getRefreshTokenUsecase(GetRefreshTokenUsecaseRef ref) =>
    GetRefreshTokenUsecase(ref.read(refreshTokenRepositoryProvider));

@Riverpod(keepAlive: true)
SaveTokensUsecase saveTokensUsecase(SaveTokensUsecaseRef ref) =>
    SaveTokensUsecase(ref.read(userAccessTokenRepositoryProvider), ref.read(refreshTokenRepositoryProvider));

@Riverpod(keepAlive: true)
GetUserInfoUsecase getUserInfoUsecase(GetUserInfoUsecaseRef ref) =>
    GetUserInfoUsecase(ref.read(userInfoRepositoryProvider));
