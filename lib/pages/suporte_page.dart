import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suporte_provider.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final supportProvider = Provider.of<SuporteProvider>(context);

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
                "Precisa de ajuda? Aqui prezamos pela sua experiência em nossa plataforma",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text("Qualquer reclamação ou dúvida estamos à disposição."),
              SizedBox(height: 24),
              TextField(
                controller: supportProvider.mensagemController,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Digite aqui o problema encontrado...",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => supportProvider.enviarMensagem(context),
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
