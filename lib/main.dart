import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'tools/notification_handler.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final notifications = Notifications((message) {
    print("Notificação recebida: $message");
  });
  notifications.setUpFirebase();

  runApp(RedeSocialApp());
}

class RedeSocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plataforma Profissional Anônima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
