import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(RedeSocialApp());
}

class RedeSocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plataforma Profissional Anônima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
    );
  }
}
