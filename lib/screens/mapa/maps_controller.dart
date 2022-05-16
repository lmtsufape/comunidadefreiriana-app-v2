import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_detalhes.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;

  Set<Marker> makers = <Marker>{};
  late GoogleMapController mapController;

  get mapsController => mapController;

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
    loadInstituition();
  }

  loadInstituition() async {
    final cadastromode = MapsRepository().cadastromodel;
    for (var cadastro in cadastromode) {
      makers.add(Marker(
        markerId: MarkerId(cadastro.nome),
        position: LatLng(cadastro.latitute, cadastro.longitude),
        icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(),
          'lib/assets/images/icone_marker.png',
        ),
        onTap: () => {
          showModalBottomSheet(
            context: appKey.currentState!.context,
            builder: (context) => MapsDetalhes(model: cadastro),
          )
        },
      ));
    }
    notifyListeners();
  }

  getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      return e.toString();
    }
    notifyListeners();
  }

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();
    if (!ativado) {
      return Future.error('Por favor, habilite a localização no smartphone');
    }

    permissao = await Geolocator.checkPermission();
    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error('Você precisa autorizar o acesso à localização');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('Você precisa autorizar o acesso à localização');
    }

    return await Geolocator.getCurrentPosition();
  }

  void setState(Null Function() param0) {}
}
