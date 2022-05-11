import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  List<LatLng> tappedPoints = [];

  late String title;

// funcao que atualiza o estado do mapa e salva a coordenada na lista tappedPoints.
  void _handleTap(LatLng latlng) {
    setState(() {
      if (kDebugMode) {
        print(latlng);
      }
      tappedPoints.add(latlng);
    });
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleTextStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          title: const Text(
            'Mapa',
          ),
          backgroundColor: Colors.blue),
      body: ChangeNotifierProvider<MapsController>(
          create: (context) => MapsController(),
          child: Builder(builder: (context) {
            final local = context.watch<MapsController>();
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(local.lat, local.long),
                zoom: 15,
              ),
              onCameraMove: (position) {
                if (kDebugMode) {
                  print(position);
                }
              },
              onTap: _handleTap,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: local.onMapCreated,
              markers: local.makers,
            );
          })),
    );
  }
}
