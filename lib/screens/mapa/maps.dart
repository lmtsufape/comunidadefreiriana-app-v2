import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
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
  Set<Marker> makers = <Marker>{};
  double lat = -8.8240327;
  double long = -36.0143199;
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
    // ignore: unused_local_variable
    final _controller = Provider.of<MapsController>(context);
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
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: (controller) => onMapCreated,
              onCameraMove: (position) {
                if (kDebugMode) {
                  print(position);
                }
              },
              onTap: _handleTap,
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
