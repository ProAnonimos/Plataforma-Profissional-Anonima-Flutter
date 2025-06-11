import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final TextEditingController _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.support_agent, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                "Precisa de ajuda? Aqui prexamos pela sua experiência em nossa plataforma",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("Qualquer reclamação ou dúvida estamos à disposição."),
              SizedBox(height: 24),
              TextField(
                controller: _mensagemController,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite aqui o problema encontrado...",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("Mensagem enviada"),
                      content: Text("Obrigado por nos contatar!"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Fechar"),
                        ),
                      ],
                    ),
                  );
                  _mensagemController.clear();
                },
                icon: Icon(Icons.send),
                label: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                  child: Text("Enviar", style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
