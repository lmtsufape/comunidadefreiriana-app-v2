import 'dart:io';

import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/cadastro/new_cadastro.dart';
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/paulofreire/paulo_freire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 170,
          title: Center(
            child: Image.asset(
              'lib/assets/images/logo.png',
              width: size.width * 0.5,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'Este aplicativo busca contribuir com o registro e divulgação de organizações, movimentos sociais ou projetos que se inspiram no legado do educador Paulo Freire.',
                  strutStyle: StrutStyle(fontSize: 20),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                  icon: const Icon(
                    Icons.access_alarm_outlined,
                    color: Colors.white,
                  ),
                  color: kHomeButtonColor1,
                  text: 'Conheça Paulo Freire',
                  onPressed: () {
                    Navigator.pushNamed(context, PauloFreire.id);
                  }),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: const Icon(
                    Icons.map_outlined,
                    color: Colors.white,
                  ),
                  color: kHomeButtonColor2,
                  text: 'Mapa',
                  onPressed: () {
                    Navigator.pushNamed(context, Maps.id);
                  }),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: const Icon(
                    Icons.access_alarm_outlined,
                    color: Colors.white,
                  ),
                  color: kHomeButtonColor3,
                  text: 'Solicitar Cadastro',
                  onPressed: () {
                    Navigator.pushNamed(context, SolicitarCadastro.id);
                  }),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: const Icon(
                    Icons.access_alarm_outlined,
                    color: Colors.white,
                  ),
                  color: kHomeButtonColor4,
                  text: 'Sair do Aplicativo',
                  onPressed: () {
                    SystemNavigator.pop();
                  }),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'lib/assets/images/logo_lmts.png',
                        width: size.width * 0.3,
                      ),
                    ],
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
