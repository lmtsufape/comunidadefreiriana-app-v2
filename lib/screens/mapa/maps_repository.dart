import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapsRepository extends ChangeNotifier {
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';

  Future getInstitution() async {
    try {
      var response = await _dio.get(baseUrl + '/instituicao/aprovados');

      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        List<dynamic> data = map["data"];
        return data;
      } else {
        print('primeiro null');
        return null;
      }
    } catch (e) {
      print('é bronca pai');
    }
  }
}
