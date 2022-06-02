import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:flutter/material.dart';
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
              titleTextStyle: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              title: const Text(
                'Conheça Paulo Freire',
              ),
              elevation: 0.0,
              backgroundColor: Colors.white),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(PauloFreire)) {
                            await launchUrl(PauloFreire);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: Center(
                              child: Image.asset(
                            'lib/assets/images/paulo_freire.jpg',
                            width: 190,
                            height: 190,
                          )),
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(LinhaTempo)) {
                            await launchUrl(LinhaTempo);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(
                              Icons.history,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        )),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        HorizontalSpacerBox(size: SpacerSize.medium),
                        Text(
                          'Conheça Paulo Freire',
                          style: kTextIcons,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Linha do Tempo',
                          style: kTextIcons,
                        ),
                        HorizontalSpacerBox(size: SpacerSize.medium),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(Acervo)) {
                            await launchUrl(Acervo);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(
                              Icons.video_library,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(Biblioteca)) {
                            await launchUrl(Biblioteca);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(
                              Icons.library_books,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        )),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        HorizontalSpacerBox(size: SpacerSize.large),
                        Text(
                          'Acervo Digital',
                          style: kTextIcons,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Biblioteca',
                          style: kTextIcons,
                        ),
                        HorizontalSpacerBox(size: SpacerSize.large),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(Glossario)) {
                            await launchUrl(Glossario);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(
                              Icons.sort_by_alpha,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        )),
                    const Spacer(),
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(Memorial)) {
                            await launchUrl(Memorial);
                          }
                        },
                        child: Container(
                          width: 180,
                          height: 180,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(),
                              color: Colors.white),
                          child: const Center(
                            child: Icon(
                              Icons.call,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                        )),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        HorizontalSpacerBox(size: SpacerSize.large),
                        Text(
                          'Glossário',
                          style: kTextIcons,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Contato',
                          style: kTextIcons,
                        ),
                        HorizontalSpacerBox(size: SpacerSize.large),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'lib/assets/images/logo_ipf.png',
                          width: size.width * 0.3,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/logo_ufape.png',
                          width: size.width * 0.1,
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            'lib/assets/images/logo_lmts.png',
                            width: size.width * 0.3,
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
                )
              ],
            ),
          )),
    );
  }
}
