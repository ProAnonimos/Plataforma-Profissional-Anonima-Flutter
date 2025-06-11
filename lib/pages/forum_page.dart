import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  final List<Map<String, String>> forums = [
    {
      "nome": "Flutter",
      "descricao": "Discussões sobre Flutter e desenvolvimento mobile."
    },
    {
      "nome": "IA e Machine Learning",
      "descricao": "Fórum para trocar ideias sobre inteligência artificial."
    },
    {
      "nome": "Dicas de Carreira",
      "descricao": "Conselhos e dúvidas sobre carreira em tecnologia."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: forums.length,
      itemBuilder: (context, index) {
        final forum = forums[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  forum['nome']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(forum['descricao']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
