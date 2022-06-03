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
<<<<<<< HEAD
  static const String baseUrl = 'http://185.28.23.76/login';
=======
  static const String baseUrl = 'http://185.28.23.76/api';
>>>>>>> b974bbaa2e78e8089e3e408386d0bf2cb155035b
  bool isLoading = false;

  Future getInstituition(BuildContext context) async {
    try {
      var response = await _dio.get(
        baseUrl + '/instituicao/aprovados',
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
