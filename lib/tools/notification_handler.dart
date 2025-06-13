import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

//versao do pdf nao funciona mais 
class Notifications {
  final void Function(String) callback;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Notifications(this.callback);

  void setUpFirebase() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    //token
    String? token = await _firebaseMessaging.getToken();
    print("token: $token");

    // mensagens
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        callback(message.notification!.body ?? "Mensagem sem corpo");
      }
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Mensagem clicada: ${message.notification?.body}");
    });
  }
}
