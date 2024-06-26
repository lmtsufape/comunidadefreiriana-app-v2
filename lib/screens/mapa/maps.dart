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
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:comunidadefreiriana/components/custom_date_formater.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/change_notifier.dart';

import '../../components/search_bar.dart' as search_bar;

final appKey = GlobalKey();

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> with WidgetsBindingObserver {
  // ignore: unused_field
  CameraPosition? cameraPosition;
  List<LatLng> tappedPoints = [];
  Set<Marker> makers = <Marker>{};

  final Completer<GoogleMapController> _controller = Completer();
  final MapsController mapController = MapsController();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      final GoogleMapController controller1 = await _controller.future;
      controller1.setMapStyle('[]');
    }
  }

  @override
  void initState() {
    super.initState();
    storeInstitution();

    WidgetsBinding.instance.addObserver(this);
  }

  //Guarda as informações de todas as instituições dentro de uma lista
  storeInstitution() async {
    var model;
    final data = await MapsRepository().getInstitution();

    for (var i in data) {
      model = InstituicaoModel(
        id: i["id"] ?? 'Não consta',
        nome: i["nome"] ?? 'Não consta',
        categoria: i["categoria"] ?? 'Não consta',
        pais: i["pais"] ?? 'Não consta',
        endereco: i["endereco"] ?? 'Não consta',
        estado: i["estado"] ?? 'Não consta',
        cidade: i["cidade"] ?? 'Não consta',
        cep: i["cep"] ?? 'Não consta',
        telefone: i["telefone"] ?? 'Não consta',
        email: i["email"] ?? 'Não consta',
        site: i["site"] ?? 'Não consta',
        coordenador: i["coordenador"] ?? 'Não consta',
        datafundacao: i["datafundacao"] == null
            ? DateTime.now()
            : DateTime.parse(i["datafundacao"]),
        latitude: i["latitude"] ?? 'Não consta',
        longitude: i["longitude"] ?? 'Não consta',
        info: i["info"] ?? 'Não consta',
      );
      loadInstitution(model);
    }
  }

//Carrega as informações das instituições no mapa
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
                onMapCreated: (GoogleMapController controller) {
                  mapController.onMapCreated(controller);
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 8,
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
        search_bar.SearchBar(
          controller: mapController.searchBarController,
          onSearch: () =>
              mapController.queryInstituition(context, (lat, long) async {
            Navigator.pop(context);
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: LatLng(lat, long), zoom: 15)));
          }),
        ),
      ]),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.extended(
                label: const Text(
                  'Instituição',
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
