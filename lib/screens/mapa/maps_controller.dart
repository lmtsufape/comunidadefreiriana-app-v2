import '../../core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'maps_detalhes.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  // ignore: unused_field
  final _api = Api();
  Set<Marker> makers = <Marker>{};
  late GoogleMapController mapController;
  get mapsController => mapController;

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
    // StoreInstitution();
    //loadInstitution();
  }

  // ignore: non_constant_identifier_names
  OnMapCreatedCadastro(GoogleMapController gmc2) async {
    mapController = gmc2;
    getPosicao();
  }

  loadInstitution() {
    var loadinst = StoreInstitution();
    // ignore: avoid_function_literals_in_foreach_calls
    loadinst.forEach((inst) async {
      makers.add(Marker(
        markerId: MarkerId(inst.nome),
        position: LatLng(inst.latitute, inst.longitude),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'lib/assets/images/icon.png'),
        onTap: () => {
          showModalBottomSheet(
            context: appKey.currentState!.context,
            builder: (context) => MapsDetalhes(model: inst),
          )
        },
      ));
    });
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  StoreInstitution() {
    var model;
    FutureBuilder<dynamic>(
        future: _api.getAllInstitutions(model),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> dataList = snapshot.data as List<dynamic>;
            return ListView.builder(
                itemCount: snapshot.data!.lenght,
                itemBuilder: (context, index) {
                  var data = dataList[index];
                  model = InstituicaoModel(
                    id: data['id'],
                    nome: data['nome'],
                    categoria: data['categoria'],
                    pais: data['pais'],
                    estado: data['estado'],
                    cidade: data['cidade'],
                    cep: data['cep'],
                    telefone: data['telefone'],
                    email: data['email'],
                    site: data['site'],
                    coordenador: data['coordenador'],
                    datafundacao: data['dataFundacao'],
                    latitude: data['latitude'],
                    longitude: data['longitude'],
                    info: data['info'],
                  );
                  return model;
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}0');
          }
          return model;
        }));
    return model;
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
