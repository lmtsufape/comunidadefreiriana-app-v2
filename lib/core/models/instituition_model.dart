// To parse this JSON data, do
//
//     final instituitionModel = instituitionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InstituitionModel instituitionModelFromJson(String str) => InstituitionModel.fromJson(json.decode(str));

String instituitionModelToJson(InstituitionModel data) => json.encode(data.toJson());

class InstituitionModel {
  InstituitionModel({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.pais,
    required this.estado,
    required this.cidade,
    required this.endereco,
    required this.cep,
    required this.telefone,
    required this.email,
    required this.site,
    required this.coordenador,
    required this.datafundacao,
    required this.latitude,
    required this.longitude,
    required this.info,
    required this.autorizado,
    required this.confirmacaoEmail,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String nome;
  final String categoria;
  final String pais;
  final String estado;
  final String cidade;
  final String endereco;
  final String cep;
  final String telefone;
  final String email;
  final String site;
  final String coordenador;
  final DateTime datafundacao;
  final String latitude;
  final String longitude;
  final dynamic info;
  final bool autorizado;
  final bool confirmacaoEmail;
  final dynamic deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory InstituitionModel.fromJson(Map<String, dynamic> json) => InstituitionModel(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        categoria: json["categoria"] == null ? null : json["categoria"],
        pais: json["pais"] == null ? null : json["pais"],
        estado: json["estado"] == null ? null : json["estado"],
        cidade: json["cidade"] == null ? null : json["cidade"],
        endereco: json["endereco"] == null ? null : json["endereco"],
        cep: json["cep"] == null ? null : json["cep"],
        telefone: json["telefone"] == null ? null : json["telefone"],
        email: json["email"] == null ? null : json["email"],
        site: json["site"] == null ? null : json["site"],
        coordenador: json["coordenador"] == null ? null : json["coordenador"],
        datafundacao: json["datafundacao"] == null ? DateTime.now() : DateTime.parse(json["datafundacao"]),
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        info: json["info"],
        autorizado: json["autorizado"] == null ? null : json["autorizado"],
        confirmacaoEmail: json["confirmacaoEmail"] == null ? null : json["confirmacaoEmail"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? DateTime.now() : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "categoria": categoria == null ? null : categoria,
        "pais": pais == null ? null : pais,
        "estado": estado == null ? null : estado,
        "cidade": cidade == null ? null : cidade,
        "endereco": endereco == null ? null : endereco,
        "cep": cep == null ? null : cep,
        "telefone": telefone == null ? null : telefone,
        "email": email == null ? null : email,
        "site": site == null ? null : site,
        "coordenador": coordenador == null ? null : coordenador,
        "datafundacao": datafundacao == null ? null : "${datafundacao.year.toString().padLeft(4, '0')}-${datafundacao.month.toString().padLeft(2, '0')}-${datafundacao.day.toString().padLeft(2, '0')}",
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "info": info,
        "autorizado": autorizado == null ? null : autorizado,
        "confirmacaoEmail": confirmacaoEmail == null ? null : confirmacaoEmail,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
