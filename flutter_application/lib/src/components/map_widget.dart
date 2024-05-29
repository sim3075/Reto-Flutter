// lib/widgets/map_widget.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_application/src/services/firestore_service.dart' as firestore_service;

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final services = await firestore_service.getAllServices();
    setState(() {
      _markers.clear();
      for (final service in services) {
        final marker = Marker(
          markerId: MarkerId(service.name),
          position: LatLng(service.location.latitude, service.location.longitude),
          infoWindow: InfoWindow(
            title: service.name,
            snippet: service.category,
          ),
        );
        _markers[service.name] = marker;
      }
    });
  }

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(6.252704298132841, -75.59066725199507),
    zoom: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initialCameraPosition,
      markers: _markers.values.toSet(),
    );
  }
}
