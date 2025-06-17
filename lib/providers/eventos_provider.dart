import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Evento {
  final String titulo;
  final String descricao;
  final DateTime data;
  final LatLng local;

  Evento({
    required this.titulo,
    required this.descricao,
    required this.data,
    required this.local,
  });
}

class EventosProvider with ChangeNotifier {
  final String apiKey = 'CEOmM2w8UM8cnd5BiTVJ0NFwrC08zlPs';
  final List<Evento> _eventos = [];

  List<Evento> get eventos => _eventos;

  Set<Marker> get marcadores => _eventos.map((evento) {
        return Marker(
          markerId: MarkerId(evento.titulo),
          position: evento.local,
          infoWindow: InfoWindow(
            title: evento.titulo,
            snippet:
                '${evento.descricao}\nData: ${evento.data.day}/${evento.data.month}/${evento.data.year}',
          ),
        );
      }).toSet();

  Future<void> buscarEventosTicketmaster() async {
    final url = Uri.parse(
        'https://app.ticketmaster.com/discovery/v2/events.json?keyword=technology&apikey=$apiKey');

    final response = await http.get(url);

    _eventos.clear(); // Limpa antes de adicionar eventos

    // adicionamos alguns eventos mockados no brasil para caso nao apareça nenhum
    _eventos.addAll([
      Evento(
        titulo: 'Dev Summit São Paulo',
        descricao: 'Encontro nacional de desenvolvedores.',
        data: DateTime(2025, 7, 20),
        local: LatLng(-23.550520, -46.633308),
      ),
      Evento(
        titulo: 'Tech Norte 2025',
        descricao: 'Evento de tecnologia no norte do país.',
        data: DateTime(2025, 8, 15),
        local: LatLng(-1.455833, -48.503887), // Belém
      ),
      Evento(
        titulo: 'Smart Cities Conference',
        descricao: 'Inovações tecnológicas para cidades inteligentes.',
        data: DateTime(2025, 9, 5),
        local: LatLng(-19.8157, -43.9542), // Contagem / MG
      ),
    ]);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final eventsJson = data['_embedded']?['events'] as List<dynamic>?;

      if (eventsJson != null) {
        for (var eventJson in eventsJson) {
          final titulo = eventJson['name'] ?? 'Evento sem nome';
          final descricao = eventJson['info'] ?? titulo;
          final dateStr = eventJson['dates']?['start']?['dateTime'];
          DateTime dataEvento = DateTime.now();
          if (dateStr != null) {
            dataEvento = DateTime.tryParse(dateStr) ?? DateTime.now();
          }

          final venue = eventJson['_embedded']?['venues']?[0];
          final location = venue?['location'];
          if (location != null) {
            final lat = double.tryParse(location['latitude'] ?? '') ?? 0.0;
            final lon = double.tryParse(location['longitude'] ?? '') ?? 0.0;

            if (lat != 0.0 && lon != 0.0) {
              _eventos.add(Evento(
                titulo: titulo,
                descricao: descricao,
                data: dataEvento,
                local: LatLng(lat, lon),
              ));
            }
          }
        }
      }
    }

    notifyListeners();
  }
}
