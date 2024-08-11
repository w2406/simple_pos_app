import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class GetAuthorizationCodeUsecase {
  Future<String> execute(String codeVerifier) async {
    final url = 'https://id.smaregi.jp/authorize?'
        'response_type=code&'
        'client_id=${dotenv.env['client_id']}&'
        'scope=${dotenv.env['scope']}&'
        'state=${_getRandomString(10)}&'
        'redirect_uri=${dotenv.env['redirect_uri']}&'
        'code_challenge=$codeVerifier&'
        'code_challenge_method=S256';

    // ログイン画面を表示
    String? code;
    try {
      final result = await FlutterWebAuth2.authenticate(url: url, callbackUrlScheme: dotenv.env['scheme'] ?? '');
      code = Uri.parse(result).queryParameters['code'];
    } catch (e) {
      print(e);
    }

    // 認可コードが取得できた場合は返す
    if (code != null) {
      return code;
    } else {
      throw Exception('Authorization failed');
    }
  }
}

// state用のランダム文字列生成
String _getRandomString(int length) {
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
