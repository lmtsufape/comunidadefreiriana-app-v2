import 'package:flutter/material.dart';
import 'package:comunidadefreiriana/constants/constants.dart';
import 'package:comunidadefreiriana/screens/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController controller = SplashScreenController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.startApp(context);
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      child: Image.asset(
        'lib/assets/images/splash.png',
        height: double.maxFinite,
        width: double.infinity,
      ),
    );
  }
}
