import 'package:comunidadefreiriana/screens/cadastro/cadastro.dart';
import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:comunidadefreiriana/screens/mapa/maps.dart';
import 'package:comunidadefreiriana/screens/paulofreire/paulo_freire.dart';
import 'package:comunidadefreiriana/screens/permission/notify.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/splash/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      supportedLocales: const [Locale('pt', 'BR')],
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => DevicePreview.appBuilder(
        context,
        ResponsiveWrapper.builder(
          widget,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
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
