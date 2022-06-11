import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';
  bool isLoading = false;

  Future getInstitution(context) async {
    try {
      var response = await _dio.get(
        baseUrl + '/instituicao/aprovados',
      );
      if (response.statusCode == 200) {
        var listInstitutions = (response.data as List).map((item) {
          return InstituicaoModel.fromJson(response.data);
        }).toList();
        //caso de ruim tenta apagar esse return abaixo e tentar novamente
        return listInstitutions;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
