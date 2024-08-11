import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token_repository_interface.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info_repository_interface.dart';

part '../../.generated/infrastructure/providers/repository_provider.g.dart';

@Riverpod(keepAlive: true)
UserAccessTokenRepositoryInterface userAccessTokenRepository(UserAccessTokenRepositoryRef ref) =>
    throw UnimplementedError();

@Riverpod(keepAlive: true)
UserInfoRepositoryInterface userInfoRepository(UserInfoRepositoryRef ref) => throw UnimplementedError();
