import 'package:pkce/pkce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/infrastructure/providers/usecase_provider.dart';

part '../../../.generated/presentation/auth/view_model/user_access_token_notifier.g.dart';

@riverpod
class UserAccessTokenNotifier extends _$UserAccessTokenNotifier {
  @override
  UserAccessToken? build() => null;

  Future<void> get() async {
    final pkcePair = PkcePair.generate();

    // 認可コード取得
    final code = await ref.read(getAuthorizationCodeUsecaseProvider).execute(pkcePair.codeChallenge);

    // アクセストークン取得
    final token = await ref.read(getUserAccessTokenUsecaseProvider).execute(code, pkcePair.codeVerifier);

    // アクセストークン保存
    await ref.read(saveUserAccessTokenUsecaseProvider).execute(token);

    state = token;
  }
}
