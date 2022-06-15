import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MapsDetalhes extends StatelessWidget {
  int? id;
  String nome;
  String endereco;
  String cidade;
  String estado;
  String telefone;
  String info;
  String site;
  MapsDetalhes(
      {Key? key,
      required this.id,
      required this.nome,
      required this.endereco,
      required this.cidade,
      required this.estado,
      required this.info,
      required this.site,
      required this.telefone})
      : super(key: key);

  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';

  getImageInstitution() async {
    try {
      var image = await _dio.get(baseUrl + '/instituicao/show/$id');

      if (image.statusCode == 200) {
        Map<String, dynamic> map = image.data;
        List<dynamic> data = map["data"]["images"];
        return data;
      } else {
        print('primeiro null');
        return null;
      }
    } catch (e) {
      print('é bronca pai');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers, unused_local_variable
    String path = '';
    final fotos = getImageInstitution();
    for (var y in fotos) {
      path = y["path"];
    }
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Wrap(
        children: [
          Image.network(
            path,
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Text(
              nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              endereco,
            ),
          ),
        ],
      ),
    );
  }
}
