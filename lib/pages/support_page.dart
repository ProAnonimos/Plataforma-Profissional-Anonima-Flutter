import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.support_agent, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text("Precisa de ajuda?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("Entre em contato conosco pelo e-mail suporte@technet.com"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Enviar Mensagem"))
          ],
        ),
      ),
    );
  }
}