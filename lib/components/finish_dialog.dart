import 'package:comunidadefreiriana/components/general_loader.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:flutter/material.dart';

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
                  'Solicitar Cadastro',
                  style: kHomeScreen2,
                ),
                content: Text(
                  "Solitação realizada com Sucesso!",
                  style: kdrawerText2,
                ),
              ),
            );
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
