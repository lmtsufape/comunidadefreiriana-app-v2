import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Center,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FontWeight,
        Icon,
        IconThemeData,
        Icons,
        Image,
        InkWell,
        Key,
        MainAxisAlignment,
        MediaQuery,
        Padding,
        Radius,
        Row,
        SafeArea,
        Scaffold,
        Size,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget,
        Wrap;
import 'package:url_launcher/url_launcher.dart';

class PauloFreire extends StatefulWidget {
  static const String id = 'paulo_freire';
  const PauloFreire({Key? key}) : super(key: key);

  @override
  State<PauloFreire> createState() => _PauloFreireState();
}

class _PauloFreireState extends State<PauloFreire> {
  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names, non_constant_identifier_names
    final PauloFreire = Uri.parse(
        'http://www.memorial.paulofreire.org/conheca-paulo-freire.html');
    // ignore: non_constant_identifier_names, prefer_const_declarations
    final LinhaTempo = Uri.parse(
        'http://memorial.paulofreire.org/Linha_do_tempo/linha_do_tempo.html');
    // ignore: non_constant_identifier_names
    final Acervo = Uri.parse('http://acervo.paulofreire.org:8080/xmlui/');
    // ignore: non_constant_identifier_names
    final Biblioteca = Uri.parse('http://biblioteca.paulofreire.org');
    // ignore: non_constant_identifier_names
    final Glossario = Uri.parse('http://glossario.paulofreire.org');
    // ignore: non_constant_identifier_names
    final Memorial = Uri.parse('http://memorial.paulofreire.org');
    // ignore: non_constant_identifier_names, unused_local_variable
    final lmts = Uri.parse('http://lmts.uag.ufrpe.br/br');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            title: const Text(
              'Conheça Paulo Freire',
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Column(
                children: [
                  const VerticalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.medium),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(PauloFreire)) {
                              await launchUrl(PauloFreire);
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Stack(
                              children: [
                                Center(
                                  child: Image.asset(
                                    'lib/assets/images/paulo_freire.jpg',
                                    width: 140,
                                    height: 140,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  child: const Text(
                                    'Conheça Paulo Freire',
                                    style: kTextIcons,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const HorizontalSpacerBox(size: SpacerSize.small),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(LinhaTempo)) {
                              await launchUrl(LinhaTempo);
                            }
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Wrap(
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        'lib/assets/images/icone_linha_do_tempo.jpg',
                                        width: 140,
                                        height: 140,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomCenter,
                                      child: const Text(
                                        'Linha do Tempo',
                                        style: kTextIcons,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.medium),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Acervo)) {
                              await launchUrl(Acervo);
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'lib/assets/images/icone_foto_video.jpg',
                                      width: 130,
                                      height: 130,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      'Acervo Digital',
                                      style: kTextIcons,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const HorizontalSpacerBox(size: SpacerSize.small),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Biblioteca)) {
                              await launchUrl(Biblioteca);
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.menu_book,
                                    color: Colors.red,
                                    size: 110,
                                  )),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      'Biblioteca',
                                      style: kTextIcons,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  const VerticalSpacerBox(size: SpacerSize.small),
                  Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.medium),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Glossario)) {
                              await launchUrl(Glossario);
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'lib/assets/images/icone_az.jpg',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      'Glossário',
                                      style: kTextIcons,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      const HorizontalSpacerBox(size: SpacerSize.small),
                      InkWell(
                          onTap: () async {
                            if (await canLaunchUrl(Memorial)) {
                              await launchUrl(Memorial);
                            }
                          },
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                              child: Wrap(
                                children: [
                                  const Center(
                                      child: Icon(
                                    Icons.call,
                                    color: Colors.red,
                                    size: 110,
                                  )),
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: const Text(
                                      'Telefone',
                                      style: kTextIcons,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  const VerticalSpacerBox(size: SpacerSize.medium),
                  Row(
                    children: const [
                      HorizontalSpacerBox(size: SpacerSize.large),
                      Text(
                        'Realização:',
                        style: kTextIcons,
                      ),
                      HorizontalSpacerBox(size: SpacerSize.verylarge),
                      Text(
                        'Desenvolvido por:',
                        style: kTextIcons,
                      ),
                    ],
                  ),
                  const VerticalSpacerBox(size: SpacerSize.tiny),
                  Row(
                    children: [
                      const HorizontalSpacerBox(size: SpacerSize.medium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'lib/assets/images/logo_ipf.png',
                            width: size.width * 0.26,
                          ),
                        ],
                      ),
                      const HorizontalSpacerBox(size: SpacerSize.medium),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              'lib/assets/images/icone_ufape_lmts.jpg',
                              width: size.width * 0.5,
                            ),
                          ],
                        ),
                        onTap: () async {
                          if (await canLaunchUrl(lmts)) {
                            await launchUrl(lmts);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
