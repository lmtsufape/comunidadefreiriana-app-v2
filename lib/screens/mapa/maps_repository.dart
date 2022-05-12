import 'package:comunidadefreiriana/core/models/cadastro_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapsRepository extends ChangeNotifier {
  // ignore: unused_field
  final List<CadastroModel> _cadastro = [
    CadastroModel(
      nome: '',
      telefone: '',
      email: '',
      cidade: '',
      estado: '',
      endereco: '',
      dataRealizacao: '',
      nomeRealizacao: '',
      info: '',
      latitute: 321321,
      longitude: 312313,
    )
  ];

  List<CadastroModel> get cadastromodel => _cadastro;
}
