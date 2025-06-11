import 'package:flutter/material.dart';
import 'login_page.dart';

class PerfilPage extends StatelessWidget {
  final String nome = "TechNomadX";
  final String email = "joaosilva@fiap.com";
  final String empresa = "fiap";
  final String bio =
      "Sou um desenvolvedor focado em mobile e análise de dados.";
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
            Icon(Icons.account_circle, size: 150, color: Colors.blue),
            SizedBox(height: 20),
            Text("Nome: $nome", style: TextStyle(fontSize: 28)),
            SizedBox(height: 10),
            Text(
              "$bio",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Habilidades: ${habilidades.join(", ")}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "(dados disponíveis apenas para você)",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("E-mail: $email", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text(
                      "Empresa/universidade: $empresa",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
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
