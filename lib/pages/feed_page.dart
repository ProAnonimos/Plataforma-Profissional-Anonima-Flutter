import 'package:flutter/material.dart';
import '../post/conteudos.dart';
import 'chat_page.dart';
import 'matchmaking_page.dart';
import 'suporte_page.dart';
import 'perfil_page.dart';
import 'forum_page.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _currentIndex = 0;
  Map<String, String>? _postSelecionado;
  final List<Widget> _pages = [
    NoticiasTecnologia(),
    MatchmakingPage(),
    ForumPage(),
    ChatPage(),
    SupportPage(),
    PerfilPage(),
  ];

  String getTitle(int index) {
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
        return "PlataFormaAnonima";
    }
  }

  void abrirPost(Map<String, String> post) {
    setState(() {
      _postSelecionado = post;
    });
  }

  void fecharPost() {
    setState(() {
      _postSelecionado = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _postSelecionado != null
              ? _postSelecionado!['titulo']!
              : getTitle(_currentIndex),
        ),
        leading: _postSelecionado != null
            ? BackButton(onPressed: fecharPost)
            : null,
      ),
      body: _postSelecionado != null
          ? Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  _postSelecionado!['conteudo']!,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          : Column(
              children: [
                if (_currentIndex == 0)
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
                          onPressed: () {
                            setState(() => _currentIndex = 2);
                          },
                          child: Text("Fórum"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() => _currentIndex = 1);
                          },
                          child: Text("Matchmaking"),
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: _currentIndex == 0
                      ? NoticiasTecnologia(onPostTap: abrirPost)
                      : _pages[_currentIndex],
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (_postSelecionado != null) {
            fecharPost();
          }
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Feed"),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Matchmaking",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: "Fórum"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: "Suporte",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
