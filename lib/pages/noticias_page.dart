import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/noticias_provider.dart';

class NoticiasPage extends StatelessWidget {
  final Function(Map<String, String>)? onPostTap;

  const NoticiasPage({this.onPostTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final noticiasProvider = Provider.of<NoticiasProvider>(context);

    if (noticiasProvider.loading) {
      return Scaffold(
        appBar: AppBar(title: Text("Notícias de Tecnologia")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (noticiasProvider.error != null) {
      return Scaffold(
        appBar: AppBar(title: Text("Notícias de Tecnologia")),
        body: Center(child: Text(noticiasProvider.error!)),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Notícias de Tecnologia")),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: noticiasProvider.noticias.length,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (context, index) {
          final noticia = noticiasProvider.noticias[index];
          return ListTile(
            leading: Icon(Icons.newspaper, color: Colors.blue),
            title: Text(noticia['titulo']!),
            subtitle: Text(
              noticia['conteudo']!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              if (onPostTap != null) {
                onPostTap!(noticia);
              } else {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: Text(noticia['titulo']!),
                    content: Text(noticia['conteudo']!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Fechar'),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
