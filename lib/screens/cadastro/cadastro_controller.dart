import 'package:comunidadefreiriana/core/api.dart';
import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:io' show File;

import 'package:path_provider/path_provider.dart';

class CadastroController with ChangeNotifier {
  bool isLoading = false;
  final InstituicaoModel cadastroModel = InstituicaoModel();
  final _api = Api();
  File? _image;
  static const String baseUrl = 'http://185.28.23.76/api';

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

  File? returnImage() {
    return _image;
  }

  void setNome(String value) {
    cadastroModel.nome = value;
    print(cadastroModel.nome);
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

  void setState(Null Function() param0) {}
}
