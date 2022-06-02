class InstituicaoModel {
  String nome;
  String telefone;
  String email;
  String cidade;
  String estado;
  String endereco;
  String pais;
  String cep;
  String dataRealizacao;
  String nomeRealizacao;
  String info;
  double latitute;
  double longitude;

  InstituicaoModel({
    this.nome = '',
    this.telefone = '',
    this.email = '',
    this.cidade = '',
    this.estado = '',
    this.endereco = '',
    this.pais = '',
    this.cep = '',
    this.dataRealizacao = '',
    this.nomeRealizacao = '',
    this.info = '',
    this.latitute = 0,
    this.longitude = 0,
  });
}
