import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
// ignore: unused_import
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  bool isLoading = false;

  Future loadInst(BuildContext context) async {
    isLoading = true;
    _api.getInstituition(context).then((value) {
      isLoading = false;
      if (value != null) {
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
        );
      } else {
        //print('Deu Ruim');
      }
    });
  }

  final List<InstituicaoModel> _cadastro = [
    InstituicaoModel(
      nome: '',
      telefone: '',
      email: '',
      cidade: '',
      estado: '',
      endereco: '',
      pais: '',
      dataRealizacao: '',
      nomeRealizacao: '',
      info: '',
      latitute:0,
      longitude: 0,
      cep: '',
    )
  ];

  List<InstituicaoModel> get cadastromodel => _cadastro;
}
