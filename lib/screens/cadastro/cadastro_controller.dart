import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        if (kDebugMode) {
          print('Deu Bom');
        }
      } else {
        if (kDebugMode) {
          print('Deu não');
        }
      }
    });
    notifyListeners();
  }

  bool validateFields() {
    if (cadastroModel.nome == '' ||
        cadastroModel.telefone == '' ||
        cadastroModel.email == '' ||
        cadastroModel.pais == '' ||
        cadastroModel.cep == '' ||
        cadastroModel.estado == '' ||
        cadastroModel.cidade == '' ||
        cadastroModel.endereco == '' ||
        cadastroModel.dataRealizacao == '' ||
        cadastroModel.nomeRealizacao == '' ||
        cadastroModel.info == '') {
      return false;
    } else {
      return true;
    }
  }

  void setNome(String value) {
    cadastroModel.nome = value;
  }

  void setTelefone(String value) {
    cadastroModel.telefone = value;
  }

  void setEmail(String value) {
    cadastroModel.email = value;
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

  void setcep(String value) {
    cadastroModel.cep = value;
  }

  void setEnd(String value) {
    cadastroModel.endereco = value;
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
