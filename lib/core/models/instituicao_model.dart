class InstituicaoModel {
  String id;
  String nome;
  String categoria;
  String pais;
  String estado;
  String cidade;
  String endereco;
  String cep;
  String telefone;
  String email;
  String site;
  String coordenador;
  String dataFundacao;
  double latitute;
  double longitude;
  String info;

  InstituicaoModel({
    this.id = '',
    this.nome = '',
    this.categoria = '',
    this.pais = '',
    this.estado = '',
    this.cidade = '',
    this.endereco = '',
    this.cep = '',
    this.telefone = '',
    this.email = '',
    this.site = '',
    this.coordenador = '',
    this.dataFundacao = '',
    this.latitute = 0,
    this.longitude = 0,
    this.info = '',
  });

  get() {
    return List<InstituicaoModel>;
  }
}
