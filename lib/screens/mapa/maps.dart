import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/new_cadastro.dart';
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
            /*title: TextFormField(
            onFieldSubmitted: (value) async {
              lat = -22.7101448;
              long = -48.0747667;

              LatLng position = LatLng(lat, long);
              mapController.moveCamera(CameraUpdate.newLatLng(position));

              final Marker marker = Marker(
                markerId: const MarkerId('123456'),
                position: position,
                icon: await BitmapDescriptor.fromAssetImage(
                    const ImageConfiguration(), 'lib/assets/images/map.png'),
                infoWindow:
                    const InfoWindow(title: 'Casa', snippet: 'Piracicaba/SP'),
              );
              setState(() {
                makers.add(marker);
              });
            },
          ),*/
            titleTextStyle: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            title: const Text(
              'Mapa',
            ),
            backgroundColor: Colors.white),
        body: Stack(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
            GoogleMap(
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
              mapType: MapType.normal,
              myLocationEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    //const Icon(Icons.add),
                    const SizedBox(height: 275.0),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, SolicitarCadastro.id);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
