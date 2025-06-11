import 'package:flutter/material.dart';

class ForumPage extends StatelessWidget {
  final bool showAppBar;

  ForumPage({this.showAppBar = false});

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
    final content = ListView.builder(
      itemCount: forums.length,
      itemBuilder: (context, index) {
        final forum = forums[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ListTile(
            title: Text(forum['nome']!, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(forum['descricao']!),
            onTap: () {
            },
          ),
        );
      },
    );

    if (showAppBar) {
      return Scaffold(
        appBar: AppBar(
          title: Text("TechNet - Fórum"),
          leading: BackButton(),
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
