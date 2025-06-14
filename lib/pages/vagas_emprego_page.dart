import 'package:flutter/material.dart';

class VagasEmpregoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vagas de Emprego"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.work, size: 80, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                "Oportunidades para você",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("Confira vagas abertas na área de tecnologia."),
              SizedBox(height: 24),
              Text(
                "• Desenvolvedor Flutter Jr. - Remoto\n• Analista de Dados - São Paulo\n• UX Designer - Híbrido RJ",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
