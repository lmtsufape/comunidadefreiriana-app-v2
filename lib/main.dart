import 'package:device_preview/device_preview.dart';

import 'app.dart' show App;
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CadastroController(),
        ),
      ],
      child: const App(),
    ),
  ));
}
