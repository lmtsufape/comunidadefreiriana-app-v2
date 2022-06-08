import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapaCadastro extends StatefulWidget {
  static const String id = 'maps_controller';
  const MapaCadastro({Key? key}) : super(key: key);

  @override
  State<MapaCadastro> createState() => _MapaCadastroState();
}

class _MapaCadastroState extends State<MapaCadastro> {
  Set<Marker> makers = <Marker>{};
  late double lat;
  late double long;
  List<LatLng> tappedPoints = [];
  int flag = 0;

  // ignore: unused_element
  void _handleTap(LatLng latlng) async {
    final local = MapsController();
    setState(() {
      tappedPoints.add(latlng);
    });
    if (local.lat != 0.0) {
      makers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(local.lat, local.long),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'lib/assets/images/icone_marker.png'),
      ));
      flag = 1;
    }
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
            'Selecione o local no mapa',
          ),
          backgroundColor: Colors.blue),
      body: Stack(children: <Widget>[
        ChangeNotifierProvider<MapsController>(
            create: (context) => MapsController(),
            child: Builder(builder: (context) {
              final local = context.watch<MapsController>();
              //getInstituittion;
              return GoogleMap(
                onMapCreated: local.OnMapCreatedCadastro,
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 17,
                ),
                myLocationButtonEnabled: true,
                onTap: _handleTap,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: local.makers,
                onCameraMove: (position) {
                  if (kDebugMode) {}
                },
              );
            })),
      ]),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                label: const Text(
                  'Próximo passo...',
                  style: kSubtitleTextStyle,
                ), // <-- Text
                backgroundColor: Colors.blue,
                icon: const Icon(
                  // <-- Icon
                  Icons.navigate_next,
                  size: 24.0,
                ),
                onPressed: () {
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
