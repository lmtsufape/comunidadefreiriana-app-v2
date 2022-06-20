class ImageModel {
  int? id;
  String path;
  String nome;
  String? instituicoesId;

  ImageModel(
      {this.id, required this.path, required this.nome, this.instituicoesId});
}
