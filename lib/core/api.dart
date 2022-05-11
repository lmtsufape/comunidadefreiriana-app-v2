import 'package:comunidadefreiriana/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Api {
  // ignore: unused_field
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/login';

  Future getInstituition(BuildContext context) async {
    try {
      var response = await _dio.get(
        baseUrl + 'instituicao/aprovados',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
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
