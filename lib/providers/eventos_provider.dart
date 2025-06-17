import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
  final List<Evento> _eventos = [
    Evento(
      titulo: 'Tech Conference SP',
      descricao: 'O maior evento de tecnologia de SP.',
      data: DateTime(2025, 7, 10),
      local: LatLng(-23.561684, -46.625378),
    ),
    Evento(
      titulo: 'Tech Rio Summit',
      descricao: 'Palestras e networking na cidade maravilhosa.',
      data: DateTime(2025, 8, 15),
      local: LatLng(-22.906847, -43.172896),
    ),
    Evento(
      titulo: 'BH Dev Meetup',
      descricao: 'Encontro de desenvolvedores em BH.',
      data: DateTime(2025, 9, 5),
      local: LatLng(-19.916681, -43.934493),
    ),
  ];

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
}
