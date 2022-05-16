import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/login';
  bool isLoading = false;

  Future getInstituition(BuildContext context) async {
    var response = await _dio.get(
      baseUrl + 'instituicao/aprovados',
    );
    if (kDebugMode) {
      print(response);
    }
  }

  Future setInst(BuildContext context) async {
    isLoading = true;
    getInstituition(context).then((value) {
      isLoading = false;
      if (value != null) {
        // ignore: unused_local_variable
        final List<InstituicaoModel> _inst = [
          InstituicaoModel(
            nome: value['nome'],
            telefone: value['telefone'],
            email: value['email'],
            cidade: value['cidade'],
            estado: value['estado'],
            endereco: value['endereco'],
            pais: value['pais'],
            dataRealizacao: value['dataRealizacao'],
            nomeRealizacao: value['nomeRealizacao'],
            info: value['info'],
            latitute: value['latitute'],
            longitude: value['longitude'],
            cep: value['cep'],
          )
        ];
      } else {
        return null;
      }
    });
  }
}
