import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/screens/mapa/maps_model.dart';

import 'package:flutter/cupertino.dart';

class MapsController with ChangeNotifier {
  late MapsModel mapsModel;
  bool isLoading = false;
  final _api = Api();

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
}
