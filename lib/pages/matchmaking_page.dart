
import 'package:flutter/material.dart';

class MatchmakingPage extends StatelessWidget {
  final List<Map<String, dynamic>> perfis = [
    {
      "nome": "João",
      "habilidades": ["Flutter", "Firebase", "UX Design"],
      "bio": "Desenvolvedor apaixonado por tecnologia mobile."
    },
    {
      "nome": "Carla",
      "habilidades": ["Python", "Machine Learning", "Data Science"],
      "bio": "Entusiasta de IA e dados."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: perfis.length,
      itemBuilder: (context, index) {
        final perfil = perfis[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(perfil['nome'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Bio: ${perfil['bio']}"),
                SizedBox(height: 8),
                Text("Habilidades: ${perfil['habilidades'].join(', ')}"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text("Ignorar")),
                    ElevatedButton(onPressed: () {}, child: Text("Interessado"))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
