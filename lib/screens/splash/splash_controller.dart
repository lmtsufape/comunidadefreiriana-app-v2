import 'package:comunidadefreiriana/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

class SplashScreenController {
  void startApp(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.popAndPushNamed(context, HomeScreen.id);

      // Navigator.popAndPushNamed(context, HomeScreen.id);
    });
  }
}
