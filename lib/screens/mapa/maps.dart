// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, unnecessary_type_check
import 'dart:io';
import 'package:comunidadefreiriana/components/error_dialog.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
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

class _MapsState extends State<Maps> {
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

  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  StoreInstitution() async {
    ImageModel imgModel;
    var model;
    var data2;
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
      String idPhoto = i["id"];
      data2 = await MapsRepository().getImageInstitution(idPhoto);
      imgModel = ImageModel(
          path: data2["path"],
          nome: data2["nome"],
          instituicoesId: data2["instituicoes_id"]);
      loadInstitution(model, imgModel);
    }
  }

  loadInstitution(x, y) async {
    ImageModel imgModel;
    InstituicaoModel model = x;
    ImageModel img = y;
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
              return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Wrap(children: [
                    Image.network(
                        'http://185.28.23.76:8010/storage/${img.path}'),
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
                    const VerticalSpacerBox(size: SpacerSize.large),
                    Wrap(
                      children: [
                        const HorizontalSpacerBox(size: SpacerSize.small),
                        const Text(
                          'Telefone',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Text(
                              '${model.telefone}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                      ],
                    ),
                    Wrap(
                      children: [
                        const HorizontalSpacerBox(size: SpacerSize.small),
                        const Text(
                          'E-mail',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Text(
                              '${model.email}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                      ],
                    ),
                    Row(
                      children: const [
                        HorizontalSpacerBox(size: SpacerSize.small),
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
                        const HorizontalSpacerBox(size: SpacerSize.small),
                        Text(
                          '${model.site}',
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                    const VerticalSpacerBox(size: SpacerSize.large),
                    Wrap(
                      children: [
                        const HorizontalSpacerBox(size: SpacerSize.small),
                        const Text(
                          'Mais Informações',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            const HorizontalSpacerBox(size: SpacerSize.small),
                            Text(
                              '${model.info}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(140, 30),
                              alignment: const AlignmentDirectional(-1, 0),
                              backgroundColor: Colors.blue,
                            ),
                            label: const Text(
                              'Outras info',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ), // <-- Text

                            icon: const Icon(
                              // <-- Icon
                              Icons.arrow_forward_ios,
                              size: 15.0,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              final data = await MapsRepository()
                                  .getImageInstitution(model.id);
                              imgModel = ImageModel(
                                  path: data["path"],
                                  nome: data["nome"],
                                  instituicoesId: data["instituicoes_id"]);
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12, horizontal: 24),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(12))),
                                            child: Wrap(children: [
                                              Image.network(
                                                  'http://185.28.23.76:8010/storage/${imgModel.path}'),
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
                                                    'Pais',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.pais}',
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
                                                    'Estado',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.estado}',
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
                                                    'Cidade',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.cidade}',
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
                                                    'Endereço',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.endereco}',
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
                                                    'CEP',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.cep}',
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
                                                    'Telefone',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                    'Coordenador(a)',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.coordenador}',
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
                                                    'Data de Fundação',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.datafundacao}',
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
                                                    'Latitude',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.latitude}',
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
                                                    'Longitude',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
                                                      Text(
                                                        '${model.longitude}',
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
                                                    'Mais Informações',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const HorizontalSpacerBox(
                                                          size:
                                                              SpacerSize.small),
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
                                            ])),
                                      ),
                                    );
                                  });
                            })
                      ],
                    ),
                  ]));
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
            Navigator.popAndPushNamed(context, HomeScreen.id);
          },
        ),
      ),
      body: ChangeNotifierProvider<MapsController>(
          create: (context) => MapsController(),
          child: Builder(builder: (context) {
            StoreInstitution();
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
