import 'package:flutter/material.dart';

class NoticiasPage extends StatelessWidget {
  final Function(Map<String, String>)? onPostTap;

  const NoticiasPage({this.onPostTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias"),
      ),
      body: SingleChildScrollView(
        child: Center(  
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,  
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.newspaper, size: 80, color: Colors.blue),
                SizedBox(height: 20),
                Text(
                  "Notícias de Tecnologia",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Fique por dentro das últimas novidades do mundo tech.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Text(
                  "• Flutter 4.0 está em desenvolvimento...\n• Google lança novo chip para IA...\n• GitHub Copilot ganha melhorias...",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
