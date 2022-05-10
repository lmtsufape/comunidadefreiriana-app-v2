import 'package:comunidadefreiriana/core/models/cadastro_model.dart';
import 'package:flutter/cupertino.dart';

class CadastroController with ChangeNotifier {
  late CadastroModel cadastroModel;
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
}
