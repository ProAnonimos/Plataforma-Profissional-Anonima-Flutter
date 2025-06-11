import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> mensagens = [
    {"remetente": "Ana", "mensagem": "Você viu a nova IA da Google?"},
    {"remetente": "Lucas", "mensagem": "Sim! Incrível como está avançado."},
    {"remetente": "Maria", "mensagem": "Quero testar o novo iOS."},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: mensagens.length,
      itemBuilder: (context, index) {
        final msg = mensagens[index];
        return ListTile(
          leading: CircleAvatar(child: Text(msg['remetente']![0])),
          title: Text(msg['remetente']!),
          subtitle: Text(msg['mensagem']!),
        );
      },
    );
  }
}
