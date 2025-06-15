import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/login_page.dart';
import 'firebase_messaging/firebase_messaging.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(PlataformaAnonima());
}

class PlataformaAnonima extends StatefulWidget {
  @override
  _PlataformaAnonimaState createState() => _PlataformaAnonimaState();
}

class _PlataformaAnonimaState extends State<PlataformaAnonima> {
  late FirebaseNotifications _firebaseNotifications;

  @override
  void initState() {
    super.initState();

    _firebaseNotifications = FirebaseNotifications((message) {
      print("Notificação recebida: $message");
    });

    _firebaseNotifications.setUpFirebase();
  }

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
