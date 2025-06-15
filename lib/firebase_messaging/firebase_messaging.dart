import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  final void Function(String) callback;

  FirebaseNotifications(this.callback);

  void setUpFirebase() async {
    if (Platform.isIOS) {
      await _requestIOSPermissions();
    }

   FirebaseMessaging messaging = FirebaseMessaging.instance;

  
    String? token = await messaging.getToken();
    print("Token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        callback(message.notification!.body ?? "Mensagem sem conteúdo");
      }
    });
  }

  Future<void> _requestIOSPermissions() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
