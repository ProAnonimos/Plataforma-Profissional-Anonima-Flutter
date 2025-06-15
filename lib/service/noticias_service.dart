import 'dart:convert';
import 'package:http/http.dart' as http;

class NoticiasService {
  static const String _apiKey = 'c18640f701a3449786561e297f11f41f';

  Future<List<Map<String, String>>> fetchNoticias() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?category=technology&apiKey=$_apiKey',
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List articles = data['articles'];

      return articles.map<Map<String, String>>((art) {
        return {
          'titulo': art['title'] ?? 'Sem título',
          'conteudo': art['description'] ?? 'Sem descrição',
        };
      }).toList();
    } else {
      throw Exception('Erro ao carregar notícias: ${response.statusCode}');
    }
  }
}
