import 'package:flutter/material.dart';

class SolicitarCadastro extends StatefulWidget {
  static const String id = 'solicitar_cadastro';
  const SolicitarCadastro({Key? key}) : super(key: key);

  @override
  State<SolicitarCadastro> createState() => _SolicitarCadastroState();
}

class _SolicitarCadastroState extends State<SolicitarCadastro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('LMTS'),
    );
  }
}
