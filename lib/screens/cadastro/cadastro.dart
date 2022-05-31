import 'dart:io';
import 'package:comunidadefreiriana/components/auth_form_field.dart';
import 'package:comunidadefreiriana/components/finish_dialog.dart';
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
  File? _image;

  Future getImage(ImageSource gallery) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagemPermanente = await salvarPermanente(image.path);

      setState(() {
        // ignore: unnecessary_this
        this._image = imagemPermanente;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Falha ao selecionar imagem: $e');
      }
    }
  }

  Future<File> salvarPermanente(String imagePath) async {
    final diretorio = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    // ignore: unnecessary_brace_in_string_interps
    final image = File('${diretorio.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
                  late CadastroController _controller =
                      context.watch<CadastroController>();
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
                          onChanged: (String value) =>
                              _controller.setNome(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setTelefone(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setEmail(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setCidade(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setEstado(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setEnd(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setPais(value),
                        ),
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
                          inputType: TextInputType.name,
                          onChanged: (String value) =>
                              _controller.setcep(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setDataRealizacao(value),
                        ),
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
                          onChanged: (String value) =>
                              _controller.setNomeRealizacao(value),
                        ),
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
                                  onChanged: (String value) =>
                                      _controller.setMaisInfomacoes(value)),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => getImage(ImageSource.gallery),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Mídia',
                                style: kHomeScreen2,
                              ),
                              Icon(
                                Icons.add_a_photo,
                                color: kDetailColor,
                              ),
                            ],
                          ),
                        ),
                        const Divider(color: kSecondaryTextColor),
                        const VerticalSpacerBox(size: SpacerSize.large),
                        SizedBox(
                          child: _image != null
                              ? Image.file(_image!,
                                  width: 250, height: 250, fit: BoxFit.cover)
                              : Image.asset(''),
                          height: 200,
                          width: 250,
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                        const Center(
                            child: Text(
                          'Campos com (*) são obrigatórios!',
                          style: kCadastro,
                        )),
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
                            color: kDetailColor2),
                      ])),
                    ),
                  );
                }))));
  }
}
