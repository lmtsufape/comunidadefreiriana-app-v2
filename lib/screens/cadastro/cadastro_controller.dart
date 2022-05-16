
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroController with ChangeNotifier {
  late InstituicaoModel cadastroModel;
  late InstituicaoModel getInstituicoes;

  final _dio = Dio();
  static const String baseUrl = 'http://185.28.23.76/login';

  Future finishCadastro(BuildContext context) async {
    try {
      Response response = await _dio.post(baseUrl + 'instituicao/store',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Provider.of<InstituicaoModel>(context, listen: false)}',
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

  void setPais(String value) {
    cadastroModel.pais = value;
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

  void setLatitude(double value) {
    cadastroModel.latitute = value;
  }

  void setLongitude(double value) {
    cadastroModel.longitude = value;
  }

  // -> RECEBENDO DADOS DA API DAS INSTITUIÇÕES

  void getNome(String value) {
    getInstituicoes.nome = value;
  }

  void getTelefone(String value) {
    getInstituicoes.telefone = value;
  }

  void getEmail(String value) {
    getInstituicoes.telefone = value;
  }

  void getCidade(String value) {
    getInstituicoes.cidade = value;
  }

  void getEstado(String value) {
    getInstituicoes.estado = value;
  }

  void getPais(String value) {
    getInstituicoes.pais = value;
  }

  void getNomeRealizacao(String value) {
    getInstituicoes.nomeRealizacao = value;
  }

  void getDataRealizacao(String value) {
    getInstituicoes.dataRealizacao = value;
  }

  void getMaisInfomacoes(String value) {
    getInstituicoes.info = value;
  }

  void getLatitude(double value) {
    getInstituicoes.latitute = value;
  }

  void getLongitude(double value) {
    getInstituicoes.longitude = value;
  }
}
