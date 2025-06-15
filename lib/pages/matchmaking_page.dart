import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/matchmaking_provider.dart';

class MatchmakingPage extends StatelessWidget {
  void _mostrarFimPerfis(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Fim dos perfis"),
        content: Text("Você já visualizou todos os perfis."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MatchmakingProvider>();

    final perfil = provider.perfilAtualDados;

    if (perfil == null) {
      return Center(
        child: ElevatedButton(
          onPressed: () {
            provider.reset();
          },
          child: Text("Reiniciar"),
        ),
      );
    }

    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) {
          final larguraTela = MediaQuery.of(context).size.width;
          if (details.globalPosition.dx < larguraTela / 2) {
            provider.aceitar();
          } else {
            provider.recusar();
          }
          if (provider.perfilAtual >= provider.perfis.length) {
            _mostrarFimPerfis(context);
          }
        },
        child: SafeArea(
          child: Dismissible(
            key: ValueKey(perfil['nome']),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                provider.recusar();
              } else if (direction == DismissDirection.endToStart) {
                provider.aceitar();
              }
              if (provider.perfilAtual >= provider.perfis.length) {
                _mostrarFimPerfis(context);
              }
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.close, color: Colors.white, size: 40),
            ),
            secondaryBackground: Container(
              color: Colors.green,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.check, color: Colors.white, size: 40),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 360,
                    child: Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              perfil['nome'],
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Bio:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(perfil['bio']),
                            SizedBox(height: 16),
                            Text(
                              "Habilidades:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(perfil['habilidades'].join(', ')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    width: 360,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.aceitar();
                              if (provider.perfilAtual >= provider.perfis.length) {
                                _mostrarFimPerfis(context);
                              }
                            },
                            icon: Icon(Icons.check, color: Colors.white, size: 28),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                              child: Text("Aceitar",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.recusar();
                              if (provider.perfilAtual >= provider.perfis.length) {
                                _mostrarFimPerfis(context);
                              }
                            },
                            icon: Icon(Icons.close, color: Colors.white, size: 28),
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 14.0),
                              child: Text("Recusar",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
