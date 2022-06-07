import 'dart:convert';

import 'package:comunidadefreiriana/core/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';
  bool isLoading = false;

  getInstituition() async {
    var url = Uri.parse('http://185.28.23.76/api/instituicao/aprovados');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
