import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VagasProvider extends ChangeNotifier {
  List _vagas = [];
  bool _loading = true;
  String? _error;

  List get vagas => _vagas;
  bool get loading => _loading;
  String? get error => _error;

  VagasProvider() {
    fetchVagas();
  }

  Future<void> fetchVagas() async {
    _loading = true;
    _error = null;
    notifyListeners();

    final url = Uri.parse('https://www.themuse.com/api/public/jobs?page=1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _vagas = data['results'];
      } else {
        _error = 'Erro ao carregar vagas: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Erro: $e';
    }

    _loading = false;
    notifyListeners();
  }
}
