import 'package:flutter/material.dart';

class MatchmakingProvider with ChangeNotifier {
  final List<Map<String, dynamic>> perfis = [
    {
      "nome": "StardewCoder",
      "habilidades": ["Flutter", "Firebase", "UX Design"],
      "bio": "Desenvolvedor apaixonado por tecnologia mobile."
    },
    {
      "nome": "TechNomadX",
      "habilidades": ["Python", "Machine Learning", "Data Science"],
      "bio": "Entusiasta de IA e dados."
    },
  ];

  int _perfilAtual = 0;

  int get perfilAtual => _perfilAtual;

  Map<String, dynamic>? get perfilAtualDados =>
      _perfilAtual < perfis.length ? perfis[_perfilAtual] : null;

  void aceitar() {
    if (_perfilAtual < perfis.length) {
      _perfilAtual++;
      notifyListeners();
    }
  }

  void recusar() {
    if (_perfilAtual < perfis.length) {
      _perfilAtual++;
      notifyListeners();
    }
  }

  bool get acabou => _perfilAtual >= perfis.length;

  void reset() {
    _perfilAtual = 0;
    notifyListeners();
  }
}
