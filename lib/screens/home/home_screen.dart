import 'dart:io';

import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
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
          toolbarHeight: 150,
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
                  strutStyle: StrutStyle(fontFamily: 'Roboto', fontSize: 15),
                ),
              ),
              Spacer(),
              PrimaryButton(
                  icon: Icon(Icons.access_alarm_outlined),
                  color: kHomeButtonColor1,
                  text: 'Conheça Paulo Freire',
                  onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: Icon(Icons.access_alarm_outlined),
                  color: kHomeButtonColor2,
                  text: 'Mapa',
                  onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: Icon(Icons.access_alarm_outlined),
                  color: kHomeButtonColor3,
                  text: 'Solicitar Cadastro',
                  onPressed: () {}),
              SizedBox(
                height: 10,
              ),
              PrimaryButton(
                  icon: Icon(Icons.access_alarm_outlined),
                  color: kHomeButtonColor4,
                  text: 'Sair do Aplicativo',
                  onPressed: () {}),
              VerticalSpacerBox(size: SpacerSize.medium),
            ],
          ),
        ),
      ),
    );
  }
}
