import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show File;

class CadastroController with ChangeNotifier {
  bool isLoading = false;
  // ignore: unused_field
  File? _image;
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
        cadastroModel.categoria == '' ||
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

/*
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagemPermanente = await salvarPermanente(image.path);

      setState(() {
        // ignore: unnecessary_this
        this._image = imagemPermanente;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Falha ao selecionar imagem: $e');
      }
    }
  }

  Future<File> salvarPermanente(String imagePath) async {
    final diretorio = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    // ignore: unnecessary_brace_in_string_interps
    final image = File('${diretorio.path}/$name');

    return File(imagePath).copy(image.path);
  }

  clearImage() {
    // ignore: unnecessary_this
    setState(() {
      // ignore: unnecessary_this
      this._image = null;
    });
  }
*/
  void setNome(String value) {
    cadastroModel.nome = value;
  }

  void setCategoria(String value) {
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
