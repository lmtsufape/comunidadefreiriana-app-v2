import 'dart:developer';

import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/core/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MapsRepository extends ChangeNotifier {
  final _dio = Dio();

  Future getInstitution() async {
    try {
      var response = await _dio.get(kBaseUrl + '/api/instituicao/aprovados');

      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        List<dynamic> data = map["data"];
        log('OK! Retornando data das instituições');
        return data;
      } else {
        log('Ocorreu um erro ao pegar os dados da instituição: ${response.data} com status de: ${response.statusCode}');

        return null;
      }
    } on DioError catch (e) {
      log(e.error);

      rethrow;
    } catch (e) {
      log('error ${e.toString()}');
      return null;
    }
  }

  Future getImageInstitution(id) async {
    // ignore: unnecessary_brace_in_string_interps
    try {
      var image = await _dio.get(kBaseUrl + '/api/instituicao/show/$id');

      if (image.statusCode == 200) {
        Map<String, dynamic> map = image.data;
        List<dynamic> data = map["data"]["images"];
        return data[0];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
