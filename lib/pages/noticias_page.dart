import 'package:flutter/material.dart';

class NoticiasTecnologia extends StatelessWidget {
  final List<String> noticias = [
    "Google lança nova IA para programadores.",
    "Apple apresenta iOS 20 com recursos inéditos.",
    "Meta investe em realidade aumentada para redes sociais.",
    "OpenAI anuncia novo modelo GPT para empresas."
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          leading: Icon(Icons.article, color: Colors.blue),
          title: Text(noticias[index]),
        ),
      ),
    );
  }
}
