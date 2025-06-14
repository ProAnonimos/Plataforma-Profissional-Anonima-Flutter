import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(PlataformaAnonima());
}

class PlataformaAnonima extends StatelessWidget {
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
