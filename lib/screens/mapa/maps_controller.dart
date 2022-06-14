// ignore_for_file: unnecessary_type_check, prefer_typing_uninitialized_variables
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'maps_detalhes.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  // ignore: unused_field
  Set<Marker> makers = <Marker>{};
  late GoogleMapController mapController;
  get mapsController => mapController;

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
    StoreInstitution();
  }

  // ignore: non_constant_identifier_names
  OnMapCreatedCadastro(GoogleMapController gmc2) async {
    mapController = gmc2;
    getPosicao();
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
      icon: await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(), 'lib/assets/images/icone_marker@3x.png'),
      onTap: () => {
        showModalBottomSheet<void>(
            context: appKey.currentState!.context,
            builder: (context) {
              return MapsDetalhes(detalhes: model);
            })
      },
    ));

    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  StoreInstitution() async {
    var model;
    final data = await MapsRepository().getInstitution();

    // ignore: unused_local_variable
    var instituicoes = [data];
    for (var i in data) {
      model = InstituicaoModel(
        id: i["id"],
        nome: i["nome"],
        categoria: i["categoria"],
        pais: i["pais"],
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

  getPosicao() async {
    try {
      final posicao = await _posicaoAtual();
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
}
