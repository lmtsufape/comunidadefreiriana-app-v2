// ignore_for_file: unused_import
import 'package:comunidadefreiriana/components/error_dialog.dart';
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

  StoreInstitution() async {
    var model;
    final data = await MapsRepository().getInstitution();

    for (var i in data) {
      model = InstituicaoModel(
        id: i["id"],
        nome: i["nome"],
        categoria: i["categoria"],
        pais: i["pais"],
        endereco: i["endereco"],
        estado: i["estado"],
        cidade: i["cidade"],
        cep: i["cep"],
        telefone: i["telefone"],
        email: i["email"],
        site: i["site"],
        coordenador: i["coordenador"],
        datafundacao: i["dataFundacao"],
        latitude: i["latitude"],
        longitude: i["longitude"],
        info: i["info"],
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
    final fotos = await MapsRepository().getImageInstitution(model.id);
    for (var y in fotos) {
      path = y["path"];
    }
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
                child: Wrap(
                  children: [
                    Image.network(
                      path,
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, left: 24),
                      child: Text(
                        model.nome.toString(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Endereço',
                          style: kDescription,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 60, left: 24),
                          child: Text(
                            model.endereco.toString(),
                          ),
                        ),
                        const Icon(Icons.phone),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 60, left: 24),
                            child: Text(
                              model.telefone.toString(),
                            )),
                        const Icon(Icons.email),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 60, left: 24),
                            child: Text(
                              model.email.toString(),
                            )),
                      ],
                    ),
                    const Divider(color: kSecondaryTextColor),
                    Row(
                      children: [
                        const Text(
                          'Data da realização',
                          style: kDescription,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(bottom: 60, left: 24),
                            child: Text(
                              model.datafundacao.toString(),
                            )),
                        const Text(
                          'Nome da realização',
                          style: kDescription,
                        ),
                      ],
                    ),
                    const Text(
                      'Mais informações',
                      style: kDescription,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 60, left: 24),
                        child: Text(
                          model.info.toString(),
                        )),
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
                  zoom: 17,
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
                    components: [Component(Component.country, 'np')],
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
