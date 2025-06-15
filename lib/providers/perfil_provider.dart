import 'package:flutter/material.dart';

class PerfilProvider extends ChangeNotifier {
  String nome = "TechNomadX";
  String email = "joaosilva@fiap.com";
  String empresa = "fiap";
  String bio = "Sou um desenvolvedor focado em mobile e análise de dados.";
  List<String> habilidades = ["Flutter", "SQL", "Python"];

  void setNome(String novoNome) {
    nome = novoNome;
    notifyListeners();
  }
}
