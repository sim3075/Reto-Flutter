
import 'package:flutter/material.dart';
import 'package:flutter_application/src/services/firestore_service.dart' as firestore_service;
import 'package:google_maps_flutter/google_maps_flutter.dart';



class HomePage extends StatefulWidget {
  
  static const String routename = "HomePage";
  const HomePage({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
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
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('DeliveryAPP'),
          backgroundColor: const Color.fromARGB(255, 96, 56, 142),
          centerTitle: true,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: const CameraPosition(
            target: LatLng(6.252704298132841, -75.59066725199507),
            zoom: 25.0,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );

  }
}