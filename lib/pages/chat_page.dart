import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {'text': 'Olá! Precisa de ajuda com Flutter?', 'isUser': false},
    {'text': 'Sim! Estou com uma dúvida sobre o layout.', 'isUser': true},
    {'text': 'Claro! Manda a dúvida.', 'isUser': false},
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isUser': true});
        _controller.clear();
      });
    }
  }

  Widget _buildMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final msg = _messages[index];
              return _buildMessage(msg['text'], msg['isUser']);
            },
          ),
        ),
        Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Digite uma mensagem...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
