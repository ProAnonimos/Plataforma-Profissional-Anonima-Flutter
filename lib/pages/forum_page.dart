import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/forum_provider.dart';

class ForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final forums = context.watch<ForumProvider>().forums;

    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: forums.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Participe de discussões anônimas",
              style: TextStyle(fontSize: 20, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          );
        }

        final forum = forums[index - 1];

        return Card(
          margin: EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  forum['nome']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(forum['descricao']!),
              ],
            ),
          ),
        );
      },
    );
  }
}
