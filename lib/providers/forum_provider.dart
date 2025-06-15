import 'package:flutter/material.dart';

class ForumProvider with ChangeNotifier {
  final List<Map<String, String>> _forums = [
    {
      "nome": "Flutter",
      "descricao": "Discussões sobre Flutter e desenvolvimento mobile.",
    },
    {
      "nome": "IA e Machine Learning",
      "descricao": "Fórum para trocar ideias sobre inteligência artificial.",
    },
    {
      "nome": "Dicas de Carreira",
      "descricao": "Conselhos e dúvidas sobre carreira em tecnologia.",
    },
  ];

  List<Map<String, String>> get forums => List.unmodifiable(_forums);
}
