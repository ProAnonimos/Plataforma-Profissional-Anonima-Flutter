import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/eventos_provider.dart';

class EventosPage extends StatefulWidget {
  @override
  _EventosPageState createState() => _EventosPageState();
}

class _EventosPageState extends State<EventosPage> {
  late GoogleMapController _mapController;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final provider = Provider.of<EventosProvider>(context, listen: false);
      await provider.buscarEventosTicketmaster();
      setState(() => _carregando = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final eventosProvider = Provider.of<EventosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Eventos de Tecnologia")),
      body: _carregando
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(-22.9, -43.2),
                zoom: 4.5,
              ),
              markers: eventosProvider.marcadores,
              onMapCreated: (controller) {
                _mapController = controller;
              },
            ),
    );
  }
}