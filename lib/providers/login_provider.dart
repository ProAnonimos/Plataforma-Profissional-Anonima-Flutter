import 'package:flutter/material.dart';
import 'perfil_provider.dart';

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

  Future<bool> login(PerfilProvider perfilProvider) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;

  // ************* PERFIL PRA TESTE

    if (_usuario == 'teste' && _senha == '1234') {
      perfilProvider.setNome(_usuario);
      notifyListeners();
      return true;
    } else {
      _error = "Usuário ou senha inválidos";
      notifyListeners();
      return false;
    }
  }
}
