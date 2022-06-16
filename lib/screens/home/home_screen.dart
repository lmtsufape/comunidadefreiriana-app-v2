import 'package:comunidadefreiriana/components/horizontal_spacer_box.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/paulofreire/paulo_freire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final lmts = Uri.parse('http://lmts.uag.ufrpe.br/br');
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.public,
                        color: Colors.grey,
                      ),
                      HorizontalSpacerBox(size: SpacerSize.tiny),
                      Text(
                        'Português - BR',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSpacerBox(size: SpacerSize.small),
              Image.asset(
                'lib/assets/images/logo.png',
                width: size.width * 0.8,
              ),
              const VerticalSpacerBox(size: SpacerSize.medium),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Este aplicativo busca contribuir com o registro e divulgação de organizações, movimentos sociais ou projetos que se inspiram no legado do educador Paulo Freire.',
                    strutStyle: StrutStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(1500, 50),
                  alignment: const AlignmentDirectional(-1, 0),
                  backgroundColor: kHomeButtonColor1,
                ),
                onPressed: () {
                  Navigator.popAndPushNamed(context, PauloFreire.id);
                },
                icon: const Icon(
                  Icons.ads_click,
                  size: 25.0,
                  color: Colors.white,
                ),
                label: const Text(
                  'Conheça Paulo Freire',
                  style: kSubtitleTextStyle,
                ), // <--,
              ),
              const SizedBox(
                height: 7,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(1500, 50),
                  alignment: const AlignmentDirectional(-1, 0),
                  backgroundColor: kHomeButtonColor2,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Maps.id);
                },
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 25,
                ),
                label: const Text(
                  'Mapa',
                  style: kSubtitleTextStyle,
                ),
                // <--,
              ),
              const SizedBox(
                height: 7,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(1500, 50),
                  alignment: const AlignmentDirectional(-1, 0),
                  backgroundColor: kHomeButtonColor3,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SolicitarCadastro.id);
                },
                icon: const Icon(
                  Icons.feed,
                  color: Colors.white,
                  size: 25,
                ),
                label: const Text(
                  'Solicitar Cadastro',
                  style: kSubtitleTextStyle,
                ), // <--,
              ),
              const SizedBox(
                height: 7,
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(1500, 50),
                  alignment: const AlignmentDirectional(-1, 0),
                  backgroundColor: kHomeButtonColor4,
                ),
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 25,
                ),
                label: const Text(
                  'Sair do Aplicativo',
                  style: kSubtitleTextStyle,
                ), // <--,
              ),
              const Spacer(),
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
              ),
              Row(
                children: const [
                  Spacer(),
                  Icon(Icons.expand_less),
                  Text(
                    'Link para site do LMTS.',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
