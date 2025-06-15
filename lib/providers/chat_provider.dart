import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Oi, tudo bem? Vi um comentário seu no grupo sobre mudança de carreira pra UX. Tô justamente nesse momento. Você toparia trocar umas ideias?',
      'isUser': false,
    },
    {
      'text': 'Claro! Passei por isso ano passado. Vim de desenvolvimento front. O que tá pegando mais pra você?',
      'isUser': true,
    },
    {
      'text': 'Acho que o medo de começar do zero. E também não sei se invisto em curso, portfólio, ou tento uma vaga júnior direto.',
      'isUser': false,
    },
  ];

  List<Map<String, dynamic>> get messages => List.unmodifiable(_messages);

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;
    _messages.add({'text': text.trim(), 'isUser': true});
    notifyListeners();
  }
}
