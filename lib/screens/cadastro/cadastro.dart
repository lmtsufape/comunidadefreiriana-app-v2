import 'dart:io' show File;
import 'package:comunidadefreiriana/components/auth_form_field.dart';
import 'package:comunidadefreiriana/components/finish_dialog.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/primary_buttonCadastro.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
// ignore: unused_import
import 'package:comunidadefreiriana/image_control/image_picker.controller.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SolicitarCadastro extends StatefulWidget {
  static const String id = 'solicitar_cadastro';

  const SolicitarCadastro({
    Key? key,
  }) : super(key: key);

  @override
  State<SolicitarCadastro> createState() => _SolicitarCadastroState();
}

class _SolicitarCadastroState extends State<SolicitarCadastro> {
  // ignore: unused_field

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final _controller = Provider.of<CadastroController>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Solicitar Cadastro'),
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.black,
            ),
            body: ChangeNotifierProvider<CadastroController>(
                create: (context) => CadastroController(),
                child: Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Form(
                          child: Column(children: [
                        Row(
                          children: const [
                            Text(
                              'Nome*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Nome',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setNome(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Telefone (Com DDD)*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: '(00) 0000-0000',
                            isPassword: false,
                            inputType: TextInputType.phone,
                            onChanged: (String value) {
                              _controller.setTelefone(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Email*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'example@example.com',
                            isPassword: false,
                            inputType: TextInputType.emailAddress,
                            onChanged: (String value) {
                              _controller.setEmail(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Cidade*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Garanhuns',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setCidade(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Estado*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'PE',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setEstado(value);
                            }),
                        Row(
                          children: const [
                            Text(
                              'Endereço*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Rua Fulano de Tal',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setEnd(value);
                            }),
                        Row(
                          children: const [
                            Text(
                              'País*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Brasil',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setPais(value);
                            }),
                        Row(
                          children: const [
                            Text(
                              'CEP*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: '55415-000',
                            isPassword: false,
                            inputType: TextInputType.phone,
                            onChanged: (String value) {
                              _controller.setcep(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Data da Realização*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: '00/00/0000',
                            isPassword: false,
                            inputType: TextInputType.datetime,
                            onChanged: (String value) {
                              _controller.setDataRealizacao(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Nome da Realização*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'LMTS',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setNomeRealizacao(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Title(
                              color: kPrimaryColor,
                              child: const Text(
                                'Mais Informações',
                                style: kCadastro,
                              ),
                            ),
                            const VerticalSpacerBox(size: SpacerSize.small),
                            SizedBox(
                              height: size.height * 0.09,
                              child: TextFormField(
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    fillColor: kPrimaryColor,
                                  ),
                                  onChanged: (String value) {
                                    _controller.setMaisInfomacoes(value);
                                  }),
                            ),
                          ],
                        ),
                        const Center(
                            child: Text(
                          'Campos com (*) são obrigatórios!',
                          style: kCadastro,
                        )),
                        const Divider(color: kSecondaryTextColor),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        const Center(
                            child: Text(
                          'Mídia',
                          style: kHomeScreen3,
                        )),
                        const VerticalSpacerBox(size: SpacerSize.medium),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton.extended(
                                heroTag: 1,
                                label: const Text('Galeria'), // <-- Text
                                backgroundColor: Colors.blue,
                                icon: const Icon(
                                  // <-- Icon
                                  Icons.photo_library,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  //getImage(ImageSource.gallery);
                                },
                              ),
                              const HorizontalSpacerBox(
                                  size: SpacerSize.medium),
                              FloatingActionButton.extended(
                                heroTag: 2,
                                label: const Text('Câmera'), // <-- Text
                                backgroundColor: Colors.blue,
                                icon: const Icon(
                                  // <-- Icon
                                  Icons.camera,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  // getImage(ImageSource.camera);
                                },
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),

                        const VerticalSpacerBox(size: SpacerSize.medium),
                        FloatingActionButton.extended(
                          heroTag: 3,
                          label: const Text('Delete'), // <-- Text
                          backgroundColor: Colors.blue,
                          icon: const Icon(
                            // <-- Icon
                            Icons.delete,
                            size: 24.0,
                          ),
                          onPressed: () {
                            //clearImage();
                          },
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),

                        const Divider(color: kSecondaryTextColor),
                        // ignore: avoid_print

                        PrimaryButtonCadastro(
                            icon: const Icon(Icons.access_alarm_rounded),
                            text: 'Efetuar Cadastro',
                            onPressed: () {
                              _controller.validateFields();
                              if (_controller.validateFields() == true) {
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        const FinishVisitDialog());
                              } else {
                                const AlertDialog(
                                  content: Text(
                                    'Por favor, preencha todos os campos marcados com (*)!',
                                    style: kTitlePaulo,
                                  ),
                                );
                              }
                            },
                            color: Colors.blue),
                      ])),
                    ),
                  );
                }))));
  }
}
