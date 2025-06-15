import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vagas_provider.dart';

class VagasEmpregoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vagasProvider = Provider.of<VagasProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Vagas de Emprego')),
      body: Builder(
        builder: (context) {
          if (vagasProvider.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (vagasProvider.error != null) {
            return Center(child: Text(vagasProvider.error!));
          }
          if (vagasProvider.vagas.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma vaga encontrada no momento.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: vagasProvider.vagas.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (context, index) {
              final vaga = vagasProvider.vagas[index];
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
          );
        },
      ),
    );
  }
}
