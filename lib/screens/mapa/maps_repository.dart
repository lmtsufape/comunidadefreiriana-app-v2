import 'dart:convert';

import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final _api = Api();
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';
  bool isLoading = false;

  Future<List?> getInstituition() async {
    try {
      var response = await _dio.get(
        baseUrl + '/instituicao/aprovados',
      );
      if (response.statusCode == 200) {
        List inst = jsonDecode(response.data);
        return inst.map((json) => InstituicaoModel.fromJson(json)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
