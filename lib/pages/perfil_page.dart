import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import '../providers/perfil_provider.dart';

class PerfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perfil = Provider.of<PerfilProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 150, color: Colors.blue),
            SizedBox(height: 20),
            Text("Nome: ${perfil.nome}", style: TextStyle(fontSize: 28)),
            SizedBox(height: 10),
            Text(
              perfil.bio,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              "Habilidades: ${perfil.habilidades.join(", ")}",
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
                    Text("E-mail: ${perfil.email}", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 4),
                    Text(
                      "Empresa/universidade: ${perfil.empresa}",
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
