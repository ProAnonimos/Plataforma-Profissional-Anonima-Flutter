import 'package:flutter/material.dart';

class PerfilPage extends StatelessWidget {
  final String nome = "Usuário";
  final String bio = "Sou um desenvolvedor focado em tecnologia e inovação.";
  final List<String> habilidades = ["Flutter", "Dart", "UI/UX"];

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
          ],
        ),
      ),
    );
  }
}
