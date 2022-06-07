import 'package:dio/dio.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';

class Api {
  // ignore: unused_field
  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/api';

  Future cadastrar(InstituicaoModel cadastroModel) async {
    final body = FormData.fromMap({
      'nome': cadastroModel.nome,
      'categoria': cadastroModel.categoria,
      'pais': cadastroModel.pais,
      'estado': cadastroModel.estado,
      'cidade': cadastroModel.cidade,
      'endereco': cadastroModel.endereco,
      'cep': cadastroModel.cep,
      'telefone': cadastroModel.telefone,
      'email': cadastroModel.email,
      'site': cadastroModel.site,
      'coordenador': cadastroModel.coordenador,
      'latitude': cadastroModel.latitude,
      'longitude': cadastroModel.longitude,
      'info': cadastroModel.info,
      'autorizado': false,
      'confirmacaoEmail': false,
      'datafundacao': cadastroModel.datafundacao,
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
