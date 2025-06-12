import 'package:flutter/material.dart';

class TelaPost extends StatelessWidget {
  final String titulo;
  final String conteudo;

  TelaPost({required this.titulo, required this.conteudo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(conteudo, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
