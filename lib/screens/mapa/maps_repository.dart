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
  static const String baseUrl = 'http://185.28.23.76/login';
  bool isLoading = false;

  final List<InstituicaoModel> instituicoes = [
    InstituicaoModel(
      nome: '',
      telefone: '',
      email: '',
      cidade: '',
      estado: '',
      endereco: '',
      dataRealizacao: '',
      nomeRealizacao: '',
      info: '',
      latitute: 0,
      longitude: 0,
      cep: '',
      pais: '',
    )
  ];

  Future getInstituition(BuildContext context) async {
    try {
      var response = await _dio.get(
        baseUrl + '/instituicao/aprovados',
      );
      if (response.statusCode == 200) {
        InstituicaoModel(
            nome: response.data['nome'],
            telefone: response.data['telefone'],
            email: response.data['email'],
            cidade: response.data['cidade'],
            estado: response.data['estado'],
            endereco: response.data['endereco'],
            pais: response.data['pais'],
            cep: response.data['cep'],
            dataRealizacao: response.data['dataRealizacao'],
            nomeRealizacao: response.data['nomeRealizacao'],
            info: response.data['info'],
            latitute: response.data['latitute'],
            longitude: response.data['longitude']);
        // ignore: unused_local_variable
        List<InstituicaoModel> instituicoes = [
          InstituicaoModel(
            nome: response.data['nome'],
            telefone: response.data['telefone'],
            email: response.data['email'],
            cidade: response.data['cidade'],
            estado: response.data['estado'],
            endereco: response.data['endereco'],
            pais: response.data['pais'],
            dataRealizacao: response.data['dataRealizacao'],
            nomeRealizacao: response.data['nomeRealizacao'],
            info: response.data['info'],
            latitute: response.data['latitute'],
            longitude: response.data['longitude'],
            cep: response.data['cep'],
          )
        ];
        return (response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
