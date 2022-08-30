import 'package:comunidadefreiriana/screens/mapa/maps_controller.dart';
import 'package:flutter/material.dart';
import 'package:comunidadefreiriana/screens/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController controller = SplashScreenController();
  final MapsController mapsController = MapsController();
  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    controller.startApp(context);
    mapsController.posicaoAtual();
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        'lib/assets/images/splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
