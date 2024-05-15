// To parse this JSON data, do
//
//     final instituitionModel = instituitionModelFromJson(jsonString);

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
        id: json["id"],
        nome: json["nome"],
        categoria: json["categoria"],
        pais: json["pais"],
        estado: json["estado"],
        cidade: json["cidade"],
        endereco: json["endereco"],
        cep: json["cep"],
        telefone: json["telefone"],
        email: json["email"],
        site: json["site"],
        coordenador: json["coordenador"],
        datafundacao: json["datafundacao"] == null ? DateTime.now() : DateTime.parse(json["datafundacao"]),
        latitude: json["latitude"],
        longitude: json["longitude"],
        info: json["info"],
        autorizado: json["autorizado"],
        confirmacaoEmail: json["confirmacaoEmail"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? DateTime.now() : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? DateTime.now() : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "categoria": categoria,
        "pais": pais,
        "estado": estado,
        "cidade": cidade,
        "endereco": endereco,
        "cep": cep,
        "telefone": telefone,
        "email": email,
        "site": site,
        "coordenador": coordenador,
        "datafundacao": datafundacao == null ? null : "${datafundacao.year.toString().padLeft(4, '0')}-${datafundacao.month.toString().padLeft(2, '0')}-${datafundacao.day.toString().padLeft(2, '0')}",
        "latitude": latitude,
        "longitude": longitude,
        "info": info,
        "autorizado": autorizado,
        "confirmacaoEmail": confirmacaoEmail,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
