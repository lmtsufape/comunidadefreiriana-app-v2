// ignore_for_file: unused_import
import 'package:comunidadefreiriana/screens/mapa_cadastro/mapa_cadastro.dart';
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
  String googleApikey = "AIzaSyCyitTSqdXnZnYAcBj_oQd7Ho7qcR5BvFU";
  String location = "Procurar localidade";
  String rua = "Localidade: ";
  CameraPosition? cameraPosition;
  List<LatLng> tappedPoints = [];
  late double lat;
  late double long;

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
          backgroundColor: Colors.blue),
      body: Stack(children: <Widget>[
        ChangeNotifierProvider<MapsController>(
            create: (context) => MapsController(),
            child: Builder(builder: (context) {
              final local = context.watch<MapsController>();
              //getInstituittion;
              return GoogleMap(
                onMapCreated: local.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(local.lat, local.long),
                  zoom: 17,
                ),
                zoomControlsEnabled: true,
                mapType: MapType.normal,
                markers: local.makers,
                onCameraMove: (CameraPosition cameraPositiona) {
                  cameraPosition = cameraPositiona; //when map is dragging
                },
                // onCameraIdle: () async {
                //   List<Placemark> placemarks = await placemarkFromCoordinates(
                //       cameraPosition!.target.latitude,
                //       cameraPosition!.target.longitude);
                //   setState(() {
                //     //get place name from lat and lang
                //     rua = placemarks.first.administrativeArea.toString() +
                //         ", " +
                //         placemarks.first.street.toString();
                //   });
                // },
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
                  final lang = geometry.location.lng;
                  var newlatlang = LatLng(lat, lang);

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
        Positioned(
            bottom: 100,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListTile(
                    leading: Image.asset(
                      'lib/assets/images/icone_marker.png',
                      width: 35,
                    ),
                    title: Text(
                      rua,
                      style: const TextStyle(fontSize: 18),
                    ),
                    dense: true,
                  ),
                ),
              ),
            ))
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
                  const AlertDialog(
                    title: Text(
                      'Mapa',
                      style: kHomeScreen2,
                    ),
                    content: Text(
                      "Selecione o local no mapa...",
                      style: kDescriptionFinish,
                    ),
                  );
                  Navigator.popAndPushNamed(context, MapaCadastro.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
