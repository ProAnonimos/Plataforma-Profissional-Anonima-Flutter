import 'package:flutter/material.dart';
import 'noticias_page.dart';
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
    ChatPage(),
    ForumPage(showAppBar: false), 
    MatchmakingPage(),
    SupportPage(),
    PerfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TechNet")),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ForumPage(showAppBar: true),
                        ),
                      );
                    },
                    child: Text("Fórum"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() => _currentIndex = 3); // Matchmaking
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
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "Notícias"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.forum), label: "Fórum"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Match"),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: "Suporte"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
