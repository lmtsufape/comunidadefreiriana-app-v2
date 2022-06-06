import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' show File;

import 'package:path_provider/path_provider.dart';

class CadastroController with ChangeNotifier {
  bool isLoading = false;
  // ignore: unused_field
  File? _image;
  String? valorAtualDropbox = 'Selecione';
  final InstituicaoModel cadastroModel = InstituicaoModel();
  final _api = Api();

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
        cadastroModel.categoria == 'Selecione' ||
        cadastroModel.categoria == '' ||
        cadastroModel.categoria == Null ||
        cadastroModel.pais == '' ||
        cadastroModel.estado == '' ||
        cadastroModel.cidade == '' ||
        cadastroModel.endereco == '' ||
        cadastroModel.cep == '' ||
        cadastroModel.email == '' ||
        cadastroModel.coordenador == '' ||
        cadastroModel.dataFundacao == '') {
      return false;
    } else {
      return true;
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  File? imagemSelecionada;

  imagemGaleria() async {
    final XFile? temp =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (temp != null) {
      setState(() {
        imagemSelecionada = File(temp.path);
      });
    }
  }

  imagemCamera() async {
    final XFile? temp =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (temp != null) {
      setState(() {
        imagemSelecionada = File(temp.path);
      });
    }
  }

  clearImage() {
    // ignore: unnecessary_this
    setState(() {
      // ignore: unnecessary_this
      this.imagemSelecionada = null;
    });
  }

  void setState(Null Function() param0) {}
  String? getValorAtual() {
    return valorAtualDropbox;
  }

  void setValorAtual(String? value) {
    valorAtualDropbox = value;
  }

  void setNome(String value) {
    cadastroModel.nome = value;
  }

  void setCategoria(String? value) {
    cadastroModel.categoria = value;
  }

  void setPais(String value) {
    cadastroModel.pais = value;
  }

  void setEstado(String value) {
    cadastroModel.estado = value;
  }

  void setCidade(String value) {
    cadastroModel.cidade = value;
  }

  void setEndereco(String value) {
    cadastroModel.endereco = value;
  }

  void setCEP(String value) {
    cadastroModel.cep = value;
  }

  void setTelefone(String value) {
    cadastroModel.telefone = value;
  }

  void setEmail(String value) {
    cadastroModel.email = value;
  }

  void setSite(String value) {
    cadastroModel.site = value;
  }

  void setCoord(String value) {
    cadastroModel.coordenador = value;
  }

  void setDataFund(String value) {
    cadastroModel.dataFundacao = value;
  }

  void setLat(double value) {
    cadastroModel.latitute = value;
  }

  void setLong(double value) {
    cadastroModel.longitude = value;
  }

  void setMaisInfomacoes(String value) {
    cadastroModel.info = value;
  }
}
