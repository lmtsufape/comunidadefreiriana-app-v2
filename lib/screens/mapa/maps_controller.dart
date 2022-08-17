// ignore_for_file: unnecessary_type_check, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;

  // ignore: unused_field
  late GoogleMapController mapController;
  get mapsController => mapController;

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
  }

  getPosicao() async {
    try {
      final posicao = await posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long)));
    } catch (e) {
      return e.toString();
    }
    notifyListeners();
  }

  posicaoAtual() async {
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
