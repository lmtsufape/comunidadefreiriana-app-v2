import 'package:comunidadefreiriana/components/error_dialog.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/mapa_cadastro/mapa_cadastro_controller.dart';
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
  Set<Marker> markers = <Marker>{};
  late double lat;
  late double long;
  List<LatLng> tappedPoints = [];
  int flag = 0;

  void _setMarker(LatLng point) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('marker'),
          position: point,
        ),
      );
    });
  }

  // ignore: unused_element
  handleTap(LatLng latlng) async {
    final local = MapaCadastroController();
    setState(() {
      tappedPoints.add(latlng);
    });
    markers.add(Marker(
      markerId: const MarkerId(''),
      position: LatLng(local.lat, local.long),
      icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), 'lib/assets/images/icone_marker@2x.png'),
    ));

    flag = 1;
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
        ChangeNotifierProvider<MapaCadastroController>(
            create: (context) => MapaCadastroController(),
            child: Builder(builder: (context) {
              final local = context.watch<MapaCadastroController>();
              //getInstituittion;
              return GoogleMap(
                onMapCreated: local.OnMapCreatedCadastro,
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 17,
                ),
                myLocationButtonEnabled: true,
                onTap: (point) {
                  setState(() {
                    tappedPoints.add(point);
                  });
                },
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: markers,
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
                    showDialog(
                        context: context,
                        builder: (context) => const ErrorDialog(
                            mensage: 'Selecione algum lugar no mapa!'));
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
