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
    final Uri PauloFreire =
        Uri.parse('https://memorial.paulofreire.org/conheca-paulo-freire.html');
    final Uri LinhaTempo = Uri.parse(
        'https://memorial.paulofreire.org/Linha_do_tempo/linha_do_tempo.html');
    final Uri Acervo = Uri.parse('https://acervo.paulofreire.org:8080/xmlui/');
    final Uri Biblioteca = Uri.parse('https://biblioteca.paulofreire.org/');
    final Uri Glossario = Uri.parse('https://glossario.paulofreire.org/');
    final Uri Memorial = Uri.parse('https://memorial.paulofreire.org/');
    final Uri _url = Uri.parse('https://lmts.uag.ufrpe.br/br');
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
              backgroundColor: Colors.white),
          body: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        launchUrl(PauloFreire);
                      },
                      child: Image.asset(
                        'lib/assets/images/paulo_freire.jpg',
                        width: size.width * 0.35,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                      onPressed: () {
                        launchUrl(LinhaTempo);
                      },
                      child: const Icon(
                        Icons.history,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                      onPressed: () {
                        launchUrl(Acervo);
                      },
                      child: const Icon(
                        Icons.video_library,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                      onPressed: () {
                        launchUrl(Biblioteca);
                      },
                      child: const Icon(
                        Icons.library_books,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                      onPressed: () {
                        launchUrl(Glossario);
                      },
                      child: const Icon(
                        Icons.sort_by_alpha,
                        color: Colors.red,
                        size: 60,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: size * 0.22,
                      ),
                      onPressed: () {
                        launchUrl(Memorial);
                      },
                      child: const Icon(
                        Icons.call,
                        color: Colors.red,
                        size: 60,
                      ),
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
                      onTap: () => launchUrl(_url),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
