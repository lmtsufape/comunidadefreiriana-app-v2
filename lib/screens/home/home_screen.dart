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
          title: Image.asset(
            'lib/assets/logo.png',
            width: size.width * 0.25,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: Text(
                    ' Este aplicativo busca contribuir com o registro e divulgação de organizações, movimentos sociais ou projetos que se inspiram no legado do educador Paulo Freire.'),
              ),
              VerticalSpacerBox(size: SpacerSize.medium),
            ],
          ),
        ),
      ),
    );
  }
}
