import 'package:comunidadefreiriana/app.dart';
import 'package:comunidadefreiriana/core/models/cadastro_model.dart';
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:comunidadefreiriana/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CadastroController(),
      ),
    ],
    child: const App(),
  ));
}
