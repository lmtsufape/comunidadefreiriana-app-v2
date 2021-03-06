// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, unnecessary_type_check
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comunidadefreiriana/components/error_dialog.dart';
import 'package:comunidadefreiriana/components/map_info_subtitle.dart';
import 'package:comunidadefreiriana/components/map_info_title.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/map_inst_screen.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/core/models/image_model.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:comunidadefreiriana/components/custom_date_formater.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/change_notifier.dart';

final appKey = GlobalKey();

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> with WidgetsBindingObserver {
  // ignore: unused_field
  static const kGoogleApiKey = 'AIzaSyCyitTSqdXnZnYAcBj_oQd7Ho7qcR5BvFU';
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  String path = '';
  String location = "Procurar localidade";
  CameraPosition? cameraPosition;
  List<LatLng> tappedPoints = [];
  late double lat;
  late double long;
  Set<Marker> makers = <Marker>{};

  Completer<GoogleMapController> controller = Completer();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      final GoogleMapController controller1 = await controller.future;
      controller1.setMapStyle('[]');
    }
  }

  @override
  void initState() {
    super.initState();
    storeInstitution();

    WidgetsBinding.instance.addObserver(this);
  }

  //Guarda as informa????es de todas as institui????es dentro de uma lista
  storeInstitution() async {
    var model;
    final data = await MapsRepository().getInstitution();

    for (var i in data) {
      model = InstituicaoModel(
        id: i["id"] ?? 'N??o consta',
        nome: i["nome"] ?? 'N??o consta',
        categoria: i["categoria"] ?? 'N??o consta',
        pais: i["pais"] ?? 'N??o consta',
        endereco: i["endereco"] ?? 'N??o consta',
        estado: i["estado"] ?? 'N??o consta',
        cidade: i["cidade"] ?? 'N??o consta',
        cep: i["cep"] ?? 'N??o consta',
        telefone: i["telefone"] ?? 'N??o consta',
        email: i["email"] ?? 'N??o consta',
        site: i["site"] ?? 'N??o consta',
        coordenador: i["coordenador"] ?? 'N??o consta',
        datafundacao: DateTime.parse(i["datafundacao"]),
        latitude: i["latitude"] ?? 'N??o consta',
        longitude: i["longitude"] ?? 'N??o consta',
        info: i["info"] ?? 'N??o consta',
      );
      loadInstitution(model);
    }
  }

//Carrega as informa????es das institui????es no mapa
  loadInstitution(x) async {
    InstituicaoModel model = x;
    var lat = double.parse(model.latitude!);
    assert(lat is double);
    var long = double.parse(model.longitude!);
    assert(long is double);
    setState(() {
      makers.add(
        Marker(
            markerId: MarkerId(model.nome.toString()),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: model.nome),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return MapInstScreen(model: model);
                  });
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
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
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          //onPressed:() => Navigator.pop(context, false),
          onPressed: () {
            Navigator.popAndPushNamed(context, HomeScreen.id);
          },
        ),
      ),
      body: Stack(children: <Widget>[
        ChangeNotifierProvider<MapsController>(
            create: (context) => MapsController(),
            child: Builder(builder: (context) {
              final local = context.watch<MapsController>();
              return GoogleMap(
                onMapCreated: local.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 10,
                ),
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: makers,
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona;
                  //when map is dragging
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
                  'Institui????o',
                  style: kSubtitleTextStyle,
                ), // <-- Text
                backgroundColor: Colors.blue,
                icon: const Icon(
                  // <-- Icon
                  Icons.add,
                  size: 24.0,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, SolicitarCadastro.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
