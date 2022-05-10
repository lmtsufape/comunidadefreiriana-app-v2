import 'package:comunidadefreiriana/components/auth_form_field.dart';
import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/image_control/image_selector.dart';
import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/components/secundary_button.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/image_control/image_controller.dart';
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
  late ImageController? controller;
  @override
  void didChangeDependencies() {
    controller = Provider.of<ImageController>(context);
    super.didChangeDependencies();
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
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                    child: Column(children: [
                  AuthFormField(
                      label: 'Nome',
                      isPassword: false,
                      inputType: TextInputType.name,
                      onChanged: (String value) => _controller.setNome(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Telefone(Com DDD)',
                      isPassword: false,
                      inputType: TextInputType.phone,
                      onChanged: (String value) =>
                          _controller.setTelefone(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Email',
                      isPassword: false,
                      inputType: TextInputType.emailAddress,
                      onChanged: (String value) => _controller.setEmail(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Cidade',
                      isPassword: false,
                      inputType: TextInputType.name,
                      onChanged: (String value) =>
                          _controller.setCidade(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Estado',
                      isPassword: false,
                      inputType: TextInputType.name,
                      onChanged: (String value) =>
                          _controller.setEstado(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Data da Realização',
                      isPassword: false,
                      inputType: TextInputType.datetime,
                      onChanged: (String value) =>
                          _controller.setDataRealizacao(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  AuthFormField(
                      label: 'Nome da Realização',
                      isPassword: false,
                      inputType: TextInputType.name,
                      onChanged: (String value) =>
                          _controller.setNomeRealizacao(value)),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  InkWell(
                    onTap: () => controller!.selectImages(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'MÍDIA',
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
                      : const SizedBox(),
                  const Divider(color: kSecondaryTextColor),
                  PrimaryButton(
                      icon: const Icon(Icons.access_alarm_rounded),
                      text: 'Efetuar Cadastro',
                      onPressed: () {},
                      color: kDetailColor2),
                ])),
              ),
            )));
  }
}
