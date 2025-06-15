import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationProvider with ChangeNotifier {
  String? _message;

  String? get message => _message;

  void initialize() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _message = message.notification!.body ?? "Mensagem sem conteúdo";
        notifyListeners();
      }
    });

    String? token = await messaging.getToken();
    print("Token: $token");

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print('Token atualizado: $newToken');
    });
  }
}
