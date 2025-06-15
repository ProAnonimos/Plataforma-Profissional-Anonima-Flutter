import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/feed_provider.dart';
import '../post/conteudos.dart';
import 'chat_page.dart';
import 'matchmaking_page.dart';
import 'suporte_page.dart';
import 'perfil_page.dart';
import 'forum_page.dart';
import 'vagas_emprego_page.dart';
import 'noticias_page.dart';

class FeedPage extends StatelessWidget {
  final List<Widget> _pages = [
    NoticiasTecnologia(),
    MatchmakingPage(),
    ForumPage(),
    ChatPage(),
    SupportPage(),
    PerfilPage(),
  ];

  String getTitle(int index, Map<String, String>? postSelecionado) {
    if (postSelecionado != null) return postSelecionado['titulo']!;
    switch (index) {
      case 0:
        return "Feed";
      case 1:
        return "Matchmaking";
      case 2:
        return "Fórum";
      case 3:
        return "Chat";
      case 4:
        return "Suporte";
      case 5:
        return "Perfil";
      default:
        return "PlataformaAnônima";
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedProvider = context.watch<FeedProvider>();
    final currentIndex = feedProvider.currentIndex;
    final postSelecionado = feedProvider.postSelecionado;

    return Scaffold(
      appBar: AppBar(
        title: Text(getTitle(currentIndex, postSelecionado)),
        leading: postSelecionado != null
            ? BackButton(onPressed: feedProvider.fecharPost)
            : null,
      ),
      body: postSelecionado != null
          ? Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  postSelecionado['conteudo']!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          : Column(
              children: [
                if (currentIndex == 0)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => NoticiasPage()),
                          ),
                          child: Text("Notícias"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => VagasEmpregoPage()),
                          ),
                          child: Text("Vagas"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () =>
                              feedProvider.mudarPagina(2), // forum
                          child: Text("Fórum"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () =>
                              feedProvider.mudarPagina(1), // matchmacking
                          child: Text("Matchmaking"),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: currentIndex == 0
                      ? NoticiasTecnologia(
                          onPostTap: feedProvider.abrirPost,
                        )
                      : _pages[currentIndex],
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: feedProvider.mudarPagina,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Match"),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Fórum"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent), label: "Suporte"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
