import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FinishVisitDialog extends StatelessWidget {
  const FinishVisitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Concluir Cadastro?',
        style: kHomeScreen2,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: kdrawerText,
            )),
        ElevatedButton(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'SOLICITAR CADASTRO',
                  style: kHomeScreen2,
                ),
                content: const Text(
                  "Solicitação realizada com sucesso!",
                  style: kDescriptionFinish,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Fechar',
                        style: kdrawerText,
                      )),
                ],
              ),
            );
            Provider.of<CadastroController>(context, listen: false)
                .finishCadastro(context);
          },
          child: const Text(
            'Concluir',
            style: kTextDetails,
          ),
        ),
      ],
    );
  }
}
