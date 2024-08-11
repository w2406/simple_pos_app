import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_pos_app/infrastructure/api/api_client.dart';
import 'package:simple_pos_app/infrastructure/data/shared_preferences.dart';
import 'package:simple_pos_app/infrastructure/providers/repository_provider.dart';
import 'package:simple_pos_app/infrastructure/repositories/auth/user_access_token_repository.dart';
import 'package:simple_pos_app/presentation/auth/view/auth_screen.dart';

void main() async {
  // envファイルの読み込み
  await dotenv.load(fileName: ".env");

  // Dioインスタンスの生成
  final dio = Dio();
  final apiClient = ApiClient(dio);

  await SharedPreferences.initialize();

  runApp(ProviderScope(
    overrides: [
      userAccessTokenRepositoryProvider.overrideWithValue(UserAccessTokenRepository(apiClient)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const AuthScreen();
  }
}
