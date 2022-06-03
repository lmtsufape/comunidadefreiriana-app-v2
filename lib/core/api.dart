import 'package:dio/dio.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';

class Api {
  // ignore: unused_field
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';

  Future cadastrar(InstituicaoModel cadastroModel) async {
    final body = FormData.fromMap({
      'nome': cadastroModel.nome,
      'telefone': cadastroModel.telefone,
      'email': cadastroModel.email,
      'cidade': cadastroModel.cidade,
      'estado': cadastroModel.estado,
      'endereco': cadastroModel.endereco,
      'pais': cadastroModel.pais,
      'cep': cadastroModel.cep,
      'info': cadastroModel.info,
      'latitude': cadastroModel.latitute.toString(),
      'longitude': cadastroModel.longitude.toString()
    });
    try {
      Response response = await _dio.post(baseUrl + '/instituicao/store',
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
