import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

final appKey = GlobalKey();

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<LatLng> tappedPoints = [];
  late double lat;
  late double long;
// funcao que atualiza o estado do mapa e salva a coordenada na lista tappedPoints.
  void _handleTap(LatLng latlng) {
    setState(() {
      if (kDebugMode) {
        print(latlng);
      }
      tappedPoints.add(latlng);
    });
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
            //getInstituittion;
            return GoogleMap(
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(local.lat, local.long),
                zoom: 17,
              ),
              onCameraMove: (position) {
                if (kDebugMode) {}
              },
              onTap: _handleTap,
              zoomControlsEnabled: true,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: local.onMapCreated,
              markers: local.makers,
            );
          })),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                label: const Text('Adicionar'), // <-- Text
                backgroundColor: Colors.blue,
                icon: const Icon(
                  // <-- Icon
                  Icons.add,
                  size: 24.0,
                ),
                onPressed: () {
                  final local = MapsController();
                  // ignore: unused_local_variable
                  final coordenadas = CadastroController();
                  // ignore: prefer_const_constructors, unused_local_variable
                  int flag = 0;
                  AlertDialog(
                    content: const Text(
                      'Selecione algum lugar no mapa.',
                      style: kdrawerText,
                    ),
                    actions: [
                      GoogleMap(
                        myLocationButtonEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(local.lat, local.long),
                          zoom: 17,
                        ),
                        onCameraMove: (position) async {
                          coordenadas.setLat(lat.toString());
                          coordenadas.setLong(long.toString());
                          flag = 1;
                        },
                        zoomControlsEnabled: true,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        onMapCreated: local.onMapCreated,
                      ),
                    ],
                  );
                  if (flag == 1) {
                    Navigator.popAndPushNamed(context, SolicitarCadastro.id);
                  } else {
                    AlertDialog(
                      title: const Text("Erro!"),
                      content: const Text("Selecione algum lugar no mapa."),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Voltar')),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
