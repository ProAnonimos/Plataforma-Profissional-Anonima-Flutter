import 'package:flutter/material.dart';
import 'login_page.dart'; 

class PerfilPage extends StatelessWidget {
  final String nome = "TechNomadX";
  final String bio = "Sou um desenvolvedor focado em mobile e análise de dados.";
  final List<String> habilidades = ["Flutter", "SQL", "Python"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text("Nome: $nome", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("$bio"),
            SizedBox(height: 10),
            Text("Habilidades: ${habilidades.join(", ")}"),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => LoginPage()),
                  (route) => false,
                );
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
