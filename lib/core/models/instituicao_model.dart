class InstituicaoModel {
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
  String? datafundacao;
  String? latitude;
  String? longitude;
  String? info;
  bool? autorizado;
  bool? confirmacaoEmail;
  Null? deletedAt;
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
      this.autorizado,
      this.confirmacaoEmail,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  InstituicaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    categoria = json['categoria'];
    pais = json['pais'];
    estado = json['estado'];
    cidade = json['cidade'];
    endereco = json['endereco'];
    cep = json['cep'];
    telefone = json['telefone'];
    email = json['email'];
    site = json['site'];
    coordenador = json['coordenador'];
    datafundacao = json['datafundacao'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    info = json['info'];
    autorizado = json['autorizado'];
    confirmacaoEmail = json['confirmacaoEmail'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
