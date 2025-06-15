import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  String _usuario = '';
  String _senha = '';
  bool _isLoading = false;
  String? _error;

  String get usuario => _usuario;
  String get senha => _senha;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void setUsuario(String value) {
    _usuario = value;
    notifyListeners();
  }

  void setSenha(String value) {
    _senha = value;
    notifyListeners();
  }

  Future<bool> login() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;

//PERFIL PRA TESTES -----------------
   if (_usuario == 'teste' && _senha == '1234') {
      notifyListeners();
      return true;
    } else {
      _error = "Usuário ou senha inválidos";
      notifyListeners();
      return false;
    }
  }
}
