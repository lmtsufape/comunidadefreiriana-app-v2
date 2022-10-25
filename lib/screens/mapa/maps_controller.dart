// ignore_for_file: unnecessary_type_check, prefer_typing_uninitialized_variables
import 'dart:developer';

import 'package:comunidadefreiriana/screens/mapa/maps_repository.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../components/map_info_subtitle.dart';
import '../../components/map_info_title.dart';
import '../../core/api.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;

  // ignore: unused_field
  final TextEditingController _searchBarController = TextEditingController();
  get searchBarController => _searchBarController;

  late GoogleMapController mapController;
  get mapsController => mapController;

  final Api _api = Api();

  onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
  }

  void queryInstituition(BuildContext context, Function(double lat, double long) onGoToLocation) {
    _api.queryInstituition(_searchBarController.text).then((value) {
      showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Instituições encontradas: ${value.length}',
                      style: TextStyle(fontSize: 28),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    value.isEmpty
                        ? Center(child: Text('Nada encontrado'))
                        : Expanded(
                            child: ListView.separated(
                                itemCount: value.length,
                                separatorBuilder: (_, index) {
                                  return SizedBox(
                                    height: 14,
                                  );
                                },
                                itemBuilder: (_, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value[index].nome,
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            value[index].cidade + ', ',
                                            style: TextStyle(fontSize: 16, color: Colors.grey),
                                          ),
                                          Text(value[index].pais),
                                          const Spacer(),
                                          Column(
                                            children: [
                                              TextButton.icon(
                                                onPressed: () => onGoToLocation(double.parse(value[index].latitude), double.parse(value[index].longitude)),
                                                label: Text('Ir para'),
                                                icon: Icon(Icons.location_on_sharp),
                                              ),
                                              TextButton.icon(
                                                icon: Icon(Icons.info),
                                                onPressed: () {
                                                  showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (BuildContext context) {
                                                        return Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: SingleChildScrollView(
                                                            child: Container(
                                                                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                                                                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(12))),
                                                                child: Wrap(children: [
                                                                  Center(
                                                                    child: Text(
                                                                      value[index].nome.toString(),
                                                                      style: const TextStyle(
                                                                        fontSize: 26,
                                                                        fontWeight: FontWeight.w600,
                                                                      ),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Text(
                                                                      '(${value[index].categoria})',
                                                                      style: const TextStyle(
                                                                        fontSize: 22,
                                                                        fontWeight: FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const MapInfoTitle(title: 'Pais'),
                                                                  MapInfoSubtitle(subtitle: value[index].pais),
                                                                  const MapInfoTitle(title: 'Estado'),
                                                                  MapInfoSubtitle(subtitle: value[index].estado),
                                                                  const MapInfoTitle(title: 'Cidade'),
                                                                  MapInfoSubtitle(subtitle: value[index].cidade),
                                                                  const MapInfoTitle(title: 'Endereço'),
                                                                  MapInfoSubtitle(subtitle: value[index].endereco),
                                                                  const MapInfoTitle(title: 'CEP'),
                                                                  MapInfoSubtitle(subtitle: value[index].cep),
                                                                  const MapInfoTitle(title: 'Telefone'),
                                                                  MapInfoSubtitle(subtitle: value[index].telefone),
                                                                  const MapInfoTitle(title: 'E-Mail'),
                                                                  MapInfoSubtitle(subtitle: value[index].email),
                                                                  const MapInfoTitle(title: 'Site'),
                                                                  MapInfoSubtitle(subtitle: value[index].site),
                                                                  const MapInfoTitle(title: 'Coordenador(a)'),
                                                                  MapInfoSubtitle(subtitle: value[index].coordenador),
                                                                  const MapInfoTitle(title: 'Data de Fundação'),
                                                                  MapInfoSubtitle(subtitle: '${value[index].datafundacao.day}/${value[index].datafundacao.month}/${value[index].datafundacao.year}'),
                                                                  const MapInfoTitle(title: 'Latitude'),
                                                                  MapInfoSubtitle(subtitle: value[index].latitude),
                                                                  const MapInfoTitle(title: 'Longitude'),
                                                                  MapInfoSubtitle(subtitle: value[index].longitude),
                                                                  // const MapInfoTitle(title: 'Mais Informações'),
                                                                ])),
                                                          ),
                                                        );
                                                      });
                                                },
                                                label: Text('Detalhes'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Divider()
                                    ],
                                  );
                                }))
                  ],
                ),
              ));
    }).catchError((e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e),
              ));
    });
  }

  getPosicao() async {
    try {
      final posicao = await posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
      log('PEGANDO POSIÇÃO');
      await mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, long))).catchError((e) {
        log('erro ao animar camera $e');
      });
    } catch (e) {
      log(e.toString());
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

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //return await Geolocator.getCurrentPosition();
  }
}
