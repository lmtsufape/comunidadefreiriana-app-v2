import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/paulofreire/paulo_freire.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/splash/splash_screen.dart';



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: DevicePreview.locale(context),
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => DevicePreview.appBuilder(
        context, widget!
      ),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        PauloFreire.id: (context) => const PauloFreire(),
        SolicitarCadastro.id: (context) => const SolicitarCadastro(),
        Maps.id: (context) => const Maps(),
      },
    );
  }
}
