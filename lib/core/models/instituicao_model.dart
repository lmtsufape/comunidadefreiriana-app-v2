import 'dart:io';


import 'package:flutter/cupertino.dart';

class InstituicaoModel with ChangeNotifier {
  int? id;
  String? nome;
  String? categoria;
  String? pais;
  String? estado;
  String? cidade;
  String? endereco;
  String? cep;
  String? telefone;
  String? email;
  String? site;
  String? coordenador;
  DateTime? datafundacao;
  String? latitude;
  String? longitude;
  String? info;
  File? imagem;
  bool? autorizado;
  bool? confirmacaoEmail;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  InstituicaoModel(
      {this.id,
      this.nome,
      this.categoria,
      this.pais,
      this.estado,
      this.cidade,
      this.endereco,
      this.cep,
      this.telefone,
      this.email,
      this.site,
      this.coordenador,
      this.datafundacao,
      this.latitude,
      this.longitude,
      this.info,
      this.imagem,
      this.autorizado,
      this.confirmacaoEmail,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});
}
