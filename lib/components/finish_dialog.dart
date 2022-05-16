import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
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
      content: const Text(
        "Você não pode desfazer este processo!",
        style: kdrawerText,
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
              builder: (context) => const AlertDialog(
                title: Text(
                  'SOLICITAR CADASTRO',
                  style: kHomeScreen2,
                ),
                content: Text(
                  "Solicitação realizada com sucesso!",
                  style: kDescriptionFinish,
                ),
                actions: [
                  TextButton(
                      onPressed: null,
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
