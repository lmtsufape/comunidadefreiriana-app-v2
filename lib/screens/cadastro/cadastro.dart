import 'package:comunidadefreiriana/components/auth_form_field.dart';
import 'package:comunidadefreiriana/components/finish_dialog.dart';
import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';

class SolicitarCadastro extends StatefulWidget {
  static const String id = 'solicitar_cadastro';
  const SolicitarCadastro({Key? key}) : super(key: key);

  @override
  State<SolicitarCadastro> createState() => _SolicitarCadastroState();
}

class _SolicitarCadastroState extends State<SolicitarCadastro> {
  //late ImageController? controller;
  @override
  //void didChangeDependencies() {
  //controller = Provider.of<ImageController>(context);
  //super.didChangeDependencies();
  //}

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
            body: Padding(
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
                      onChanged: (String value) => _controller.setNome(value)),
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
                          _controller.setTelefone(value)),
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
                      onChanged: (String value) => _controller.setEmail(value)),
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
                          _controller.setCidade(value)),
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
                          _controller.setEstado(value)),
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
                          _controller.setDataRealizacao(value)),
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
                          _controller.setNomeRealizacao(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Title(
                          color: kPrimaryColor,
                          child: const Text(
                            'Mais Informações',
                            style: kCadastro,
                          )),
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
                    //onTap: () => controller!.selectImages(context),
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
                  const SizedBox(),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  /*
                  !controller!.isUploadingImages
                      ? SizedBox(
                          child: controller!.selectedImageLength > 0
                              ? SizedBox(
                                  height: size.height * 0.2,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const HorizontalSpacerBox(
                                          size: SpacerSize.small);
                                    },
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller!.selectedImageLength,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ImageSelector(
                                          controller: controller, index: index);
                                    },
                                  ),
                                )
                              : const Text(
                                  'Nenhuma imagem selecionada',
                                  style: TextStyle(color: kErrorColor),
                                ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  !controller!.isUploadingImages
                      ? SizedBox(
                          child: controller!.selectedImageLength > 0
                              ? SecundaryButton(
                                  text: controller!.isUploadingImages
                                      ? 'Enviando imagens'
                                      : 'Enviar imagens',
                                  onPressed: () {})
                              : const SizedBox(),
                        )
                      : const SizedBox(),*/
                  const Divider(color: kSecondaryTextColor),
                  PrimaryButton(
                      icon: const Icon(Icons.access_alarm_rounded),
                      text: 'Efetuar Cadastro',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => const FinishVisitDialog());
                      },
                      color: kDetailColor2),
                ])),
              ),
            )));
  }
}
