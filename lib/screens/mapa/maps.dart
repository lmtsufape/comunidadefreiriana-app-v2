// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, unnecessary_type_check
import 'dart:io';
import 'package:comunidadefreiriana/components/error_dialog.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:comunidadefreiriana/components/custom_date_formater.dart';

final appKey = GlobalKey();

class Maps extends StatefulWidget {
  static const String id = 'maps';
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  String path = '';
  String googleApikey = "AIzaSyCyitTSqdXnZnYAcBj_oQd7Ho7qcR5BvFU";
  String location = "Procurar localidade";
  CameraPosition? cameraPosition;
  List<LatLng> tappedPoints = [];
  late double lat;
  late double long;
  Set<Marker> makers = <Marker>{};

  // ignore: non_constant_identifier_names
  StoreInstitution() async {
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
        datafundacao: DateTime.parse(i["datafundacao"]),
        latitude: i["latitude"] ?? 'Não consta',
        longitude: i["longitude"] ?? 'Não consta',
        info: i["info"] ?? 'Não consta',
      );
      loadInstitution(model);
    }
  }

  loadInstitution(x) async {
    InstituicaoModel model = x;
    var lat = double.parse(model.latitude!);
    assert(lat is double);
    var long = double.parse(model.longitude!);
    assert(long is double);

    makers.add(Marker(
        markerId: MarkerId(model.nome.toString()),
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: model.nome),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              // ignore: avoid_unnecessary_containers
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Wrap(
                  children: [
                    Center(
                      child: Wrap(
                        children: [
                          const VerticalSpacerBox(size: SpacerSize.medium),
                          Text(
                            model.nome.toString(),
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const VerticalSpacerBox(size: SpacerSize.large),
                        ],
                      ),
                    ),
                    Wrap(
                      children: [
                        Wrap(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 20,
                            ),
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Text(
                              model.endereco.toString(),
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.medium),
                    Row(
                      children: [
                        const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(130, 30),
                            alignment: const AlignmentDirectional(-1, 0),
                            backgroundColor: Colors.blue,
                          ),
                          label: const Text(
                            'Outras info',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ), // <-- Text

                          icon: const Icon(
                            // <-- Icon
                            Icons.arrow_forward_ios,
                            size: 15.0,
                            color: Colors.white,
                          ),

                          onPressed: () async {
                            final fotos = await MapsRepository()
                                .getImageInstitution(model.id);
                            for (var y in fotos) {
                              path = y["path"];
                            }
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Scaffold(
                                      body: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 24),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Wrap(
                                      children: [
                                        const Spacer(),
                                        Center(
                                          child: Text(
                                            model.nome.toString(),
                                            style: const TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Center(
                                          child: Text(
                                            '(${model.categoria})',
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Wrap(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            const Text(
                                              'Telefone',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                const HorizontalSpacerBox(
                                                    size: SpacerSize.small),
                                                Text(
                                                  '${model.telefone}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const VerticalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        Wrap(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            const Text(
                                              'E-mail',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                const HorizontalSpacerBox(
                                                    size: SpacerSize.small),
                                                Text(
                                                  '${model.email}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const VerticalSpacerBox(
                                                size: SpacerSize.large),
                                          ],
                                        ),
                                        Row(
                                          children: const [
                                            HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              'Site',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Wrap(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            Text(
                                              '${model.site}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const VerticalSpacerBox(
                                            size: SpacerSize.large),
                                        Wrap(
                                          children: [
                                            const HorizontalSpacerBox(
                                                size: SpacerSize.small),
                                            const Text(
                                              'Mais Informações',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Row(
                                              children: [
                                                const HorizontalSpacerBox(
                                                    size: SpacerSize.small),
                                                Text(
                                                  '${model.info}',
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ));
                                });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            })));
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
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(children: <Widget>[
        ChangeNotifierProvider<MapsController>(
            create: (context) => MapsController(),
            child: Builder(builder: (context) {
              final local = context.watch<MapsController>();
              StoreInstitution();
              //getInstituittion;
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
                  cameraPosition = cameraPositiona; //when map is dragging
                },
              );
            })),
        Positioned(
          top: 10,
          child: InkWell(
              onTap: () async {
                var place = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: googleApikey,
                    mode: Mode.overlay,
                    types: [],
                    strictbounds: false,
                    components: [Component(Component.country, 'br')],
                    //google_map_webservice package
                    onError: (err) {
                      if (kDebugMode) {
                        print(err);
                      }
                    });

                if (place != null) {
                  setState(() {
                    location = place.description.toString();
                  });

                  //form google_maps_webservice package
                  final plist = GoogleMapsPlaces(
                    apiKey: googleApikey,
                    apiHeaders: await const GoogleApiHeaders().getHeaders(),
                    //from google_api_headers package
                  );
                  String placeid = place.placeId ?? "0";
                  final detail = await plist.getDetailsByPlaceId(placeid);
                  final geometry = detail.result.geometry!;
                  final lat = geometry.location.lat;
                  final long = geometry.location.lng;
                  var newlatlang = LatLng(lat, long);

                  //move map camera to selected place with animation
                  MapsController().mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                          CameraPosition(target: newlatlang, zoom: 17)));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width - 40,
                      child: ListTile(
                        title: Text(
                          location,
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: const Icon(Icons.search),
                        dense: true,
                      )),
                ),
              )),
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
