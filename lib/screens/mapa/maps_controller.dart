import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_model.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsController with ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  late MapsModel mapsModel;
  bool isLoading = false;
  final _api = Api();
  Set<Marker> makers = <Marker>{};
  late GoogleMapController mapController;


   get mapsController => mapController;
   

   onMapCreated(GoogleMapController gmc) async {
    mapController = gmc;
    getPosicao();
    //loadPostos();
  }

  List<LatLng> tappedPoints = [];

// funcao que atualiza o estado do mapa e salva a coordenada na lista tappedPoints.
  void _handleTap(LatLng latlng) {
    setState(() {
      if (kDebugMode) {
        print(latlng);
      }
      tappedPoints.add(latlng);
    });
  }
  
  Future getInstituition(BuildContext context) async {
    isLoading = true;
    _api.getInstituition(context).then((value) {
      isLoading = false;
      if (value != null) {
      } else {
        //print('Deu Ruim');
      }
    });
  }

  void setSearch(String value) {
    mapsModel.search = value;
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
