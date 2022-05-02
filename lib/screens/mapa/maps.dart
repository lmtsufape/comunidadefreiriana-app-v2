import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;
  Set<Marker> makers = <Marker>{};
  double lat = -8.8240327;
  double long = -36.0143199;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onFieldSubmitted: (value) async {
            lat = -22.7101448;
            long = -48.0747667;

            LatLng position = LatLng(lat, long);
            mapController.moveCamera(CameraUpdate.newLatLng(position));

            final Marker marker = Marker(
              markerId: new MarkerId('123456'),
              position: position,
              icon: await BitmapDescriptor.fromAssetImage(
                  const ImageConfiguration(), 'icone_marker.png'),
              infoWindow: InfoWindow(title: 'Casa', snippet: 'Piracicaba/SP'),
            );
            setState(() {
              makers.add(marker);
            });
          },
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: (controller) => onMapCreated,
          onCameraMove: (position) {
            print(position);
          },
          onTap: (argument) {
            print(argument);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 11.0,
          ),
          markers: makers,
        ),
      ),
    );
  }
}
