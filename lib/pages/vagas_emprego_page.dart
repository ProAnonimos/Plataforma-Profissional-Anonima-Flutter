import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VagasEmpregoPage extends StatefulWidget {
  @override
  _VagasEmpregoPageState createState() => _VagasEmpregoPageState();
}

class _VagasEmpregoPageState extends State<VagasEmpregoPage> {
  List _vagas = [];
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchVagas();
  }

  Future<void> fetchVagas() async {
    final url = Uri.parse('https://www.themuse.com/api/public/jobs?page=1');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _vagas = data['results'];
          _loading = false;
        });
      } else {
        setState(() {
          _error = 'Erro ao carregar vagas: ${response.statusCode}';
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
      appBar: AppBar(title: Text('Vagas de Emprego')),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : _vagas.isEmpty
          ? Center(
              child: Text(
                'Nenhuma vaga encontrada no momento.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: _vagas.length,
              separatorBuilder: (_, __) => Divider(),
              itemBuilder: (context, index) {
                final vaga = _vagas[index];
                return ListTile(
                  title: Text(vaga['name'] ?? 'Sem título'),
                  subtitle: Text(
                    vaga['locations'] != null && vaga['locations'].isNotEmpty
                        ? vaga['locations'][0]['name']
                        : 'Localização não informada',
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text(vaga['name'] ?? ''),
                        content: SingleChildScrollView(
                          child: Text(
                            vaga['contents'] != null
                                ? vaga['contents'].replaceAll(
                                    RegExp(r'<[^>]*>'),
                                    '',
                                  )
                                : 'Descrição não disponível',
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: Text('Fechar'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
