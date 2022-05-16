import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroController with ChangeNotifier {
  bool isLoading = false;
  late InstituicaoModel cadastroModel;
  final _api = Api();
  static const String baseUrl = 'http://185.28.23.76/login';

  void finishCadastro(BuildContext context) async {
    isLoading = true;
    _api.cadastrar(cadastroModel).then((value) {
      isLoading = false;
      notifyListeners();
      if (value = true) {
        print('Deu Bom');
      } else {
        print('Deu não');
      }
    });
    notifyListeners();
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
}
