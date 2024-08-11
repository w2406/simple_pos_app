import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/application/auth/commands/save_user_access_token.dart';
import 'package:simple_pos_app/application/auth/queries/get_authorization_code.dart';
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
SaveUserAccessTokenUsecase saveUserAccessTokenUsecase(SaveUserAccessTokenUsecaseRef ref) =>
    SaveUserAccessTokenUsecase(ref.read(userAccessTokenRepositoryProvider));

@Riverpod(keepAlive: true)
GetUserInfoUsecase getUserInfoUsecase(GetUserInfoUsecaseRef ref) =>
    GetUserInfoUsecase(ref.read(userInfoRepositoryProvider));
