import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/new_cadastro.dart';
import 'package:comunidadefreiriana/screens/paulofreire/paulo_freire.dart';
import 'package:flutter/foundation.dart';
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
  late String title;
  String text = "";

  void _setText() {
    setState(() {
      text = title;
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
              color: Colors.black,
            ),
            title: const Text(
              'Mapa',
            ),
            backgroundColor: Colors.white),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (controller) => onMapCreated,
              onCameraMove: (position) {
                if (kDebugMode) {
                  print(position);
                }
              },
              onTap: (argument) {
                if (kDebugMode) {
                  print(argument);
                }
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, long),
                zoom: 15.0,
              ),
              markers: makers,
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Pesquisar',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  isDense: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: <Widget>[
                    //const Icon(Icons.add),
                    const SizedBox(height: 275.0),
                    FloatingActionButton.extended(
                      label: const Text('Adicionar'), // <-- Text
                      backgroundColor: Colors.blue,
                      icon: const Icon(
                        // <-- Icon
                        Icons.add,
                        size: 24.0,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, SolicitarCadastro.id);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
