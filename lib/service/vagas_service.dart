import 'dart:convert';
import 'package:http/http.dart' as http;

class VagaService {
  static Future<List> fetchVagas() async {
    final url = Uri.parse('https://www.themuse.com/api/public/jobs?page=1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] as List;
    } else {
      throw Exception('Erro ao carregar vagas: ${response.statusCode}');
    }
  }
}
