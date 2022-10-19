import 'dart:developer';

import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/core/models/instituition_model.dart';
import 'package:dio/dio.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';

class Api {
  // ignore: unused_field
  final _dio = Dio();

  getAllInstitutions(BuildContext context) async {
    try {
      var response = await _dio.get<List>(kBaseUrl + '/api/instituicao/aprovados');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<InstituitionModel>> queryInstituition(String query) async {
    List<InstituitionModel> data = [];
    try {
      final response = await _dio.get(kBaseUrl + '/api/instituicao/buscar/$query');
      if (response.statusCode == 200) {
        for (var i = 0; i < response.data['data'].length; i++) {
          data.add(InstituitionModel.fromJson(response.data['data'][i]));
        }
      } else {
        return Future.error('Desculpe, estamos com problemas internos :(');
      }
    } on DioError catch (e) {
      log('Something got wrong while quering $e');
    }

    return data;
  }

  Future cadastrar(InstituicaoModel cadastroModel) async {
    final body = FormData.fromMap({
      'nome': cadastroModel.nome,
      'categoria': cadastroModel.categoria,
      'pais': cadastroModel.pais,
      'estado': cadastroModel.estado,
      'cidade': cadastroModel.cidade,
      'endereco': cadastroModel.endereco,
      'cep': cadastroModel.cep,
      'telefone': cadastroModel.telefone,
      'email': cadastroModel.email,
      'site': cadastroModel.site,
      'coordenador': cadastroModel.coordenador,
      'latitude': cadastroModel.latitude,
      'longitude': cadastroModel.longitude,
      'info': cadastroModel.info,
      'autorizado': false,
      'confirmacaoEmail': false,
      'datafundacao': ('${cadastroModel.datafundacao!.year}-${cadastroModel.datafundacao!.month}-${cadastroModel.datafundacao!.day}').toString(),
      'imagem': MultipartFile.fromFile(cadastroModel.imagem!.path, filename: 'image.jpg')
    });
    try {
      Response response = await _dio.post(kBaseUrl + '/api/instituicao/store',
          data: body,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
