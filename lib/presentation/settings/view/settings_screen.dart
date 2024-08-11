import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_pos_app/presentation/settings/view_model/user_info_notifier.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  late Future<void> _initFunction;

  @override
  void initState() {
    super.initState();
    _initFunction = _init();
  }

  Future<void> _init() async {
    ref.read(userInfoNotifierProvider.notifier).get();
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = ref.watch(userInfoNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('設定'),
        ),
        body: FutureBuilder(
            future: _initFunction,
            builder: (context, snapshot) {
              return Center(
                child: Column(
                  children: [
                    Text('ユーザー名: ${userInfo?.name}'),
                    Text('メールアドレス: ${userInfo?.email}'),
                  ],
                ),
              );
            }));
  }
}
