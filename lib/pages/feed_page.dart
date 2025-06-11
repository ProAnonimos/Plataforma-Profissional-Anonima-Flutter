import 'package:flutter/material.dart';
import 'conteudos.dart';
import 'chat_page.dart';
import 'matchmaking_page.dart';
import 'support_page.dart';
import 'perfil_page.dart';
import 'forum_page.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getTitle(_currentIndex))),
      body: Column(
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
          Expanded(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
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

class ForumPageWithScaffold extends StatelessWidget {
  final List<Map<String, String>> forums = [
    {
      "nome": "Flutter",
      "descricao": "Discussões sobre Flutter e desenvolvimento mobile.",
    },
    {
      "nome": "IA e Machine Learning",
      "descricao": "Fórum para trocar ideias sobre inteligência artificial.",
    },
    {
      "nome": "Dicas de Carreira",
      "descricao": "Conselhos e dúvidas sobre carreira em tecnologia.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fórum"), leading: BackButton()),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: forums.length,
        itemBuilder: (context, index) {
          final forum = forums[index];
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
      ),
    );
  }
}
