import 'package:flutter/material.dart';

class SuporteProvider extends ChangeNotifier {
  final TextEditingController mensagemController = TextEditingController();

  void enviarMensagem(BuildContext context) {
    final mensagem = mensagemController.text.trim();
    if (mensagem.isEmpty) {
        SnackBar(content: Text('Mensagem vazia!')),
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Mensagem enviada"),
        content: Text("Obrigado por nos contatar!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Fechar"),
          ),
        ],
      ),
    );

    mensagemController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    mensagemController.dispose();
    super.dispose();
  }
}
