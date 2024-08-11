import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:simple_pos_app/domain/auth/user_info/user_info.dart';
import 'package:simple_pos_app/infrastructure/providers/usecase_provider.dart';

part '../../../.generated/presentation/settings/view_model/user_info_notifier.g.dart';

@riverpod
class UserInfoNotifier extends _$UserInfoNotifier {
  @override
  UserInfo? build() => null;

  void get() async {
    try {
      final userInfo = await ref.read(getUserInfoUsecaseProvider).execute();
      state = userInfo;
    } catch (e) {
      print(e);
    }
  }
}
