import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/material.dart';

class MapsDetalhes extends StatelessWidget {
  String nome;
  String endereco;
  String cidade;
  String estado;
  String telefone;
  String info;
  String site;
  MapsDetalhes(
      {Key? key,
      required this.nome,
      required this.endereco,
      required this.cidade,
      required this.estado,
      required this.info,
      required this.site,
      required this.telefone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Text(
              nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              endereco,
            ),
          ),
        ],
      ),
    );
  }
}
