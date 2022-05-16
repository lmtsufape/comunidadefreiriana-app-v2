import 'package:comunidadefreiriana/core/models/instituicao_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MapsDetalhes extends StatelessWidget {
  InstituicaoModel model;
  MapsDetalhes({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24),
            child: Text(
              model.nome,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60, left: 24),
            child: Text(
              model.endereco,
            ),
          ),
        ],
      ),
    );
  }
}
