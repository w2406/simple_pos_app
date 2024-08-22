class UserAccessToken {
  final String token;
  final DateTime createdAt;
  final int expiresIn;
  UserAccessToken(this.token, this.expiresIn, this.createdAt);

  // TODO ドメインオブジェクトに評価を書くと、ドメインの趣旨がぼやけるので評価用のドメインにオブジェクトを作成する
  bool isValid() {
    final now = DateTime.now();
    final diff = now.difference(createdAt).inSeconds;
    return diff <= expiresIn;
  }
}
