import 'package:flutter/material.dart';

class FeedProvider with ChangeNotifier {
  int _currentIndex = 0;
  Map<String, String>? _postSelecionado;

  int get currentIndex => _currentIndex;
  Map<String, String>? get postSelecionado => _postSelecionado;

  void mudarPagina(int index) {
    _currentIndex = index;
    _postSelecionado = null;
    notifyListeners();
  }

  void abrirPost(Map<String, String> post) {
    _postSelecionado = post;
    notifyListeners();
  }

  void fecharPost() {
    _postSelecionado = null;
    notifyListeners();
  }
}
