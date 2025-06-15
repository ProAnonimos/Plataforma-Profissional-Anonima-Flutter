import 'package:flutter/material.dart';
import '../service/noticias_service.dart';

class NoticiasProvider extends ChangeNotifier {
  final NoticiasService _noticiasService = NoticiasService();

  List<Map<String, String>> _noticias = [];
  bool _loading = true;
  String? _error;

  List<Map<String, String>> get noticias => _noticias;
  bool get loading => _loading;
  String? get error => _error;

  NoticiasProvider() {
    carregarNoticias();
  }

  Future<void> carregarNoticias() async {
    try {
      final noticias = await _noticiasService.fetchNoticias();
      _noticias = noticias;
      _loading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Erro: $e';
      _loading = false;
      notifyListeners();
    }
  }
}
