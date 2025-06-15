import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
=======

import 'package:firebase_core/firebase_core.dart';
import 'tools/notification_handler.dart';
>>>>>>> 47db9e9b0f46e285b8248e0486693faa9b5642fa
import 'pages/login_page.dart';
import 'providers/all_providers.dart';

<<<<<<< HEAD


=======
>>>>>>> 47db9e9b0f46e285b8248e0486693faa9b5642fa
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

<<<<<<< HEAD
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()..initialize()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => FeedProvider()),
        ChangeNotifierProvider(create: (_) => ForumProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => MatchmakingProvider()),
        ChangeNotifierProvider(create: (_) => NoticiasProvider()),
        ChangeNotifierProvider(create: (_) => PerfilProvider()),
        ChangeNotifierProvider(create: (_) => SuporteProvider()),
        ChangeNotifierProvider(create: (_) => VagasProvider()),
      ],
      child: PlataformaAnonima(),
    ),
  );
=======
  final notifications = Notifications((message) {
    print("Notificação recebida: $message");
  });
  notifications.setUpFirebase();


  runApp(RedeSocialApp());
>>>>>>> 47db9e9b0f46e285b8248e0486693faa9b5642fa
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
