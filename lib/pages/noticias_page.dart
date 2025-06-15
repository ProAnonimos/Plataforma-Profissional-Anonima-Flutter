import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NoticiasPage extends StatefulWidget {
  final Function(Map<String, String>)? onPostTap;

  const NoticiasPage({this.onPostTap, Key? key}) : super(key: key);

  @override
  _NoticiasPageState createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  List<Map<String, String>> _noticias = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchNoticias();
  }

//enquanto desenvolvido, não foram encontradas notícias em portguês e por isso estamos utilizando em inglês!
//além disso, a API de tradução do google precisa de um cartão cadastrado e achamos melhor não arriscar uma cobrança
 
  Future<void> fetchNoticias() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?category=technology&apiKey=c18640f701a3449786561e297f11f41f'
    );

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List articles = data['articles'];

        setState(() {
          _noticias = articles.map<Map<String, String>>((art) {
            return {
              'titulo': art['title'] ?? 'Sem título',
              'conteudo': art['description'] ?? 'Sem descrição',
            };
          }).toList();
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Erro ao carregar notícias: ${response.statusCode}';
          _loading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Erro: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícias de Tecnologia"),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
              : ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemCount: _noticias.length,
                  separatorBuilder: (_, __) => Divider(),
                  itemBuilder: (context, index) {
                    final noticia = _noticias[index];
                    return ListTile(
                      leading: Icon(Icons.newspaper, color: Colors.blue),
                      title: Text(noticia['titulo']!),
                      subtitle: Text(
                        noticia['conteudo']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        if (widget.onPostTap != null) {
                          widget.onPostTap!(noticia);
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
