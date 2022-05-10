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
    // ignore: non_constant_identifier_names
    final Uri PauloFreire =
        Uri.parse('https://memorial.paulofreire.org/conheca-paulo-freire.html');
    // ignore: non_constant_identifier_names
    final Uri LinhaTempo = Uri.parse(
        'https://memorial.paulofreire.org/Linha_do_tempo/linha_do_tempo.html');
    // ignore: non_constant_identifier_names
    final Uri Acervo = Uri.parse('https://acervo.paulofreire.org:8080/xmlui/');
    // ignore: non_constant_identifier_names
    final Uri Biblioteca = Uri.parse('https://biblioteca.paulofreire.org/');
    // ignore: non_constant_identifier_names
    final Uri Glossario = Uri.parse('https://glossario.paulofreire.org/');
    // ignore: non_constant_identifier_names
    final Uri Memorial = Uri.parse('https://memorial.paulofreire.org/');
    // ignore: non_constant_identifier_names, unused_local_variable
    final Uri lmts = Uri.parse('https://lmts.uag.ufrpe.br/br');
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
                        onTap: () {
                          launchUrl(PauloFreire);
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
                        onTap: () {
                          launchUrl(LinhaTempo);
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
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          launchUrl(Acervo);
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
                        onTap: () {
                          launchUrl(Biblioteca);
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
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          launchUrl(Glossario);
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
                        onTap: () {
                          launchUrl(Memorial);
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
                      onTap: () {
                        launchUrl(lmts);
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
