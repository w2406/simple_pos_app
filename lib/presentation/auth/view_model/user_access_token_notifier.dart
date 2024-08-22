import 'package:pkce/pkce.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/domain/auth/access_token/user_access_token.dart';
import 'package:simple_pos_app/infrastructure/providers/usecase_provider.dart';

part '../../../.generated/presentation/auth/view_model/user_access_token_notifier.g.dart';

// トークンが取得できたかのフラグの状態管理でよいかもれない
@riverpod
class UserAccessTokenNotifier extends _$UserAccessTokenNotifier {
  @override
  UserAccessToken? build() => null;

  Future<void> get() async {
    final pkcePair = PkcePair.generate();

    // 認可コード取得
    final code = await ref.read(getAuthorizationCodeUsecaseProvider).execute(pkcePair.codeChallenge);

    // トークン取得
    final tokens = await ref.read(getUserAccessTokenUsecaseProvider).execute(code, pkcePair.codeVerifier);

    // トークン保存
    await ref.read(saveTokensUsecaseProvider).execute(tokens.$1, tokens.$2);

    state = tokens.$1;
  }
}
