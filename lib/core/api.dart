import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';

class Api {
  // ignore: unused_field
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/login';

  Future cadastrar(InstituicaoModel cadastroModel) async {
    final body = FormData.fromMap({
      'nome': cadastroModel.nome,
      'telefone': cadastroModel.telefone,
      'cidade': cadastroModel.cidade,
      'email': cadastroModel.email,
      'estado': cadastroModel.estado,
      'pais': cadastroModel.pais,
      'info': cadastroModel.info,
      'latitude': cadastroModel.latitute.toString(),
      'longitude': cadastroModel.longitude.toString()
    });
    try {
      Response response = await _dio.post(baseUrl + 'instituicao/store',
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

  //Ta errado, resolver dps
  Future getInstituition(BuildContext context) async {
    try {
      var response = await _dio.get(
        baseUrl + 'instituicao/aprovados',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${Provider.of<InstituicaoModel>(context, listen: false)}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return (response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
