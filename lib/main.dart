import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'app.dart' show App;
import 'package:comunidadefreiriana/screens/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  //  ByteData data =
  //   await PlatformAssetBundle().load('/lib/assets/gestaocomunidadefreiriana-paulofreire-org.pem');
  //   SecurityContext.defaultContext
  //     .setTrustedCertificatesBytes(
  //     data.buffer.asUint8List());
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
