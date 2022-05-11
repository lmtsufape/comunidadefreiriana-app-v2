import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/cadastro_model.dart';
import 'package:comunidadefreiriana/core/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroController with ChangeNotifier {
  late CadastroModel cadastroModel;

  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/login';

  Future finishCadastro(BuildContext context) async {
    try {
      Response response = await _dio.post(baseUrl + 'instituicao/store',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
              'Content-Type': 'application/json',
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
  
  void setNome(String value) {
    cadastroModel.nome = value;
  }

  void setTelefone(String value) {
    cadastroModel.telefone = value;
  }

  void setEmail(String value) {
    cadastroModel.telefone = value;
  }

  void setCidade(String value) {
    cadastroModel.cidade = value;
  }

  void setEstado(String value) {
    cadastroModel.estado = value;
  }

  void setNomeRealizacao(String value) {
    cadastroModel.nomeRealizacao = value;
  }

  void setDataRealizacao(String value) {
    cadastroModel.dataRealizacao = value;
  }

  void setMaisInfomacoes(String value) {
    cadastroModel.info = value;
  }
}
