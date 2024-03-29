import 'dart:io';

import "package:nyxx/nyxx.dart";

// メイン関数
void main() {

  // アクセストークンの取得
  final Map<String, String> envVars = Platform.environment;
  final String? token = "MTAzMjkxNTM1NTgwNDM2ODkwNg.GRY1Hs.2HrLTViUBx6FqVNaG5A0O2e93FXRBDLM_GEPF4";
  if (token == null) {
    throw "Token is not difinedaaaaaaa. Please set disco_token.";
  }
  // 新しいボットのインスタンスを作成します
  final bot =
      NyxxFactory.createNyxxWebsocket(token, GatewayIntents.allUnprivileged)
        ..registerPlugin(Logging()) // デフォルトのロギングプラグイン
        ..registerPlugin(CliIntegration()) // SIGTERMおよびSIGKILLを介してアプリケーションを停止できるプラグイン
        ..registerPlugin(IgnoreExceptions()) // 発生する可能性のあるキャッチされない例外を処理するプラグイン
        ..connect();

  // ボットが起動すると発生するイベントです
  // キャッシュは空である場合もあれば、完全でない場合もあることに注意してください
  bot.eventsWs.onReady.listen((e) {
    print("Ready!");
  });

  // メッセージを受信するとイベントが発火します
  bot.eventsWs.onMessageReceived.listen((e) {
    // メッセージの内容が「Ping!」と等しいかどうかを確認します
    if (e.message.content == "Ping!") {
          print("1234");
      // メッセージが受信されたチャンネルへ「Pong!」を送ります
      e.message.channel.sendMessage(MessageBuilder.content("Pong!"));
    }
  });
}