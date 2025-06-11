import 'package:flutter/material.dart';

class NoticiasTecnologia extends StatelessWidget {
  final List<String> noticias = [
    "Experiência com Flutter após 6 meses",
    "Como eu estudei para o Github Foundations"
    "Dica para melhorar produtividade no VSCode",
    "Debate: React vs Angular em 2025",
    "Problemas comuns em deploy de apps Flutter web",
    "Melhor linguagem para backend em 2025",
    "Indicação de livro: Clean Code",
    "Curso de segurança cibernética para devs",
    "Experiência com Docker em projetos pequenos",
    "Melhores sites para aprender programação grátis",
    "Usando Git com times pequenos: dicas práticas",
    "Debate: Vale a pena aprender Rust em 2025?",
    "Curso rápido de desenvolvimento web com React"
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