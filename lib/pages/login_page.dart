import 'package:flutter/material.dart';
import 'feed_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TechNet", style: TextStyle(fontSize: 32, color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              controller: _userController,
              decoration: InputDecoration(labelText: "Usuário"),
            ),
            TextField(
              controller: _passController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Senha"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FeedPage())),
              child: Text("Entrar"),
            )
          ],
        ),
      ),
    );
  }
}
