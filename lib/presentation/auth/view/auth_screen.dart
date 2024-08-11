import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_pos_app/presentation/auth/view_model/user_access_token_notifier.dart';
import 'package:simple_pos_app/presentation/device_registration/view/device_registration_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final useAccessToken = ref.read(userAccessTokenNotifierProvider);

    // useAccessTokenがnullでない場合は端末登録画面に遷移
    useAccessToken != null
        ? Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (context) => const DeviceRegistrationScreen()), (route) => false)
        : const AuthScreen();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('認証'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('シンプルPOS'),
            ElevatedButton(
                onPressed: () {
                  // アクセストークン取得
                  ref.read(userAccessTokenNotifierProvider.notifier).get();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const DeviceRegistrationScreen()));
                },
                child: const Text('ログイン')),
          ],
        ),
      ),
    );
  }
}
