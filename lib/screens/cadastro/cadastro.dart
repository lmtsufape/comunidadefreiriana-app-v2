import 'dart:convert';
import 'dart:io';

import 'package:comunidadefreiriana/components/auth_form_field.dart'
    show AuthFormField;
import 'package:comunidadefreiriana/components/finish_dialog.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/primary_buttonCadastro.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
// ignore: unused_import
import 'package:comunidadefreiriana/image_control/image_picker.controller.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
// ignore: unused_import
import 'package:path_provider/path_provider.dart';

class SolicitarCadastro extends StatefulWidget {
  static const String id = 'solicitar_cadastro';

  const SolicitarCadastro({
    Key? key,
  }) : super(key: key);

  @override
  State<SolicitarCadastro> createState() => _SolicitarCadastroState();
}

class _SolicitarCadastroState extends State<SolicitarCadastro> {
  String? value = 'Selecione';
  // ignore: unused_field
  File? selectedImage;
  String base64Image = "";

  Future<void> chooseImage(type) async {
    // ignore: prefer_typing_uninitialized_variables
    var image;
    if (type == "camera") {
      image = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
        // won't have any error now
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    final _controller = Provider.of<CadastroController>(context);
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
                              'Categoria*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        DropdownButtonFormField(
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: kDetailColor),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: kDetailColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            value: value,
                            items: const [
                              DropdownMenuItem(
                                  child: Text('Selecione'), value: 'Selecione'),
                              DropdownMenuItem(
                                  child: Text('Cátedras Paulo Freire'),
                                  value: 'Cátedras Paulo Freire'),
                              DropdownMenuItem(
                                  child: Text('Instituição Paulo Freire'),
                                  value: 'Instituição Paulo Freire'),
                              DropdownMenuItem(
                                  child: Text(
                                      'Centros e Núcleos de Estudo e Pesquisa'),
                                  value:
                                      'Centros e Núcleos de Estudo e Pesquisa'),
                              DropdownMenuItem(
                                  child: Text('Homenagens'),
                                  value: 'Homenagens'),
                              DropdownMenuItem(
                                  child: Text('Projetos'), value: 'Projetos')
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                this.value = value;
                              });
                              _controller.setCategoria(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
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
                              'Endereço*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Exemplo,99',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setEndereco(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
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
                            label: '55555-555',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setCEP(value);
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
                              'Site',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'www.example.com',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setSite(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Coordenador*',
                              style: kCadastro,
                            ),
                          ],
                        ),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        AuthFormField(
                            label: 'Exemplo',
                            isPassword: false,
                            inputType: TextInputType.name,
                            onChanged: (String value) {
                              _controller.setCoord(value);
                            }),
                        const VerticalSpacerBox(size: SpacerSize.small),
                        Row(
                          children: const [
                            Text(
                              'Data de Fundação*',
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
                              _controller.setDataFund(value);
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
                                    _controller.getImage(ImageSource.gallery);
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
                                    _controller.getImage(ImageSource.camera);
                                  },
                                ),
                              ]),
                        ),
                        const VerticalSpacerBox(size: SpacerSize.large),
                        Padding(
                            padding: const EdgeInsets.all(8),
                            child: _controller.image != null
                                ? Image.file(
                                    _controller.image!,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  )
                                : Image.network(
                                    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 150,
                                  )),
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
                          onPressed: () {},
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
