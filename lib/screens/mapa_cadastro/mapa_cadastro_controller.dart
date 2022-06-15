import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaCadastroController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  // ignore: unused_field
  late GoogleMapController mapController2;
  get mapsController => mapController2;

  // ignore: non_constant_identifier_names
  OnMapCreatedCadastro(GoogleMapController gmc2) async {
    mapController2 = gmc2;
    getPosicao();
  }

  getPosicao() async {
    try {
      final posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      mapController2.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
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
}
