import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MapsDetalhes extends StatelessWidget {
  InstituicaoModel inst;
  MapsDetalhes({Key? key, required this.inst}) : super(key: key);
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';

  getImageInstitution() async {
    try {
      var image = await _dio.get(baseUrl + '/instituicao/show/${inst.id}');

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
              inst.nome.toString(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Text(
            'Endereço',
            style: kDescription,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              inst.endereco.toString(),
            ),
          ),
          const Icon(Icons.phone),
          Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24),
              child: Text(
                inst.telefone.toString(),
              )),
          const Icon(Icons.email),
          Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24),
              child: Text(
                inst.email.toString(),
              )),
          const Divider(color: kSecondaryTextColor),
          const Text(
            'Data da realização',
            style: kDescription,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24),
              child: Text(
                inst.datafundacao.toString(),
              )),
          const Text(
            'Nome da realização',
            style: kDescription,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24),
              child: Text(
                inst.nome.toString(),
              )),
          const Text(
            'Mais informações',
            style: kDescription,
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 60, left: 24),
              child: Text(
                inst.info.toString(),
              )),
        ],
      ),
    );
  }
}
