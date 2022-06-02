import 'package:comunidadefreiriana/core/api.dart';
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
  late MapsRepository repository;
  get mapsController => mapController;

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
    StoreInstitution();
    loadInstitution();
  }

  loadInstitution() {
    final loadinst = StoreInstitution();
    // ignore: avoid_function_literals_in_foreach_calls
    loadinst.forEach((inst) async {
      makers.add(Marker(
        markerId: MarkerId(inst.nome),
        position: LatLng(inst.latitute, inst.longitude),
        icon: await BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), 'lib/assets/images/icone_marker.png'),
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
  List StoreInstitution() {
    var model;
    FutureBuilder(
        future: repository.getInstituition(mapsController),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> dataList = snapshot.data as List<dynamic>;
            // ignore: unused_label
            itemCount:
            dataList.length;
            // ignore: unused_label
            itemBuilder:
            ((context, index) {
              var data = dataList[index];
              // ignore: unused_local_variable
              model = InstituicaoModel(
                  id: data['id'] ?? 0,
                  nome: data['nome'],
                  categoria: data['categoria'],
                  pais: data['pais'],
                  estado: data['estado'],
                  cidade: data['cidade'],
                  endereco: data['endereco'],
                  cep: data['cep'],
                  telefone: data['telefone'],
                  email: data['email'],
                  site: data['site'],
                  coordenador: data['coordenador'],
                  dataFundacao: data['dataFundacao'],
                  latitute: data['latitude'],
                  longitude: data['longitude'],
                  info: data['info']);
            });
          }
          return model;
        }));

    return model;
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
}
