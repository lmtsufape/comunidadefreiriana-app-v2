import 'package:comunidadefreiriana/components/primary_button.dart';
import 'package:comunidadefreiriana/components/vertical_spacer_box.dart';
import 'package:flutter/material.dart';

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
            children: const [
              Center(
                child: Text(
                  'Este aplicativo busca contribuir com o registro e divulgação de organizações, movimentos sociais ou projetos que se inspiram no legado do educador Paulo Freire.',
                  strutStyle: StrutStyle(fontFamily: 'Roboto', fontSize: 15),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text('Conheça Paulo Freire'),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text('Mapa'),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text('Solicitar cadastro'),
                onPressed: null,
              ),
              ElevatedButton(
                child: Text('Sair do aplicativo'),
                onPressed: null,
              ),
              VerticalSpacerBox(size: SpacerSize.medium),
            ],
          ),
        ),
      ),
    );
  }
}
