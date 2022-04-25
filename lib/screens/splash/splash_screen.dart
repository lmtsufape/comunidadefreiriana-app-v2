import 'package:comunidadefreiriana/screens/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenController controller = SplashScreenController();
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(28),
                child: Image.asset('lib/assets/images/logo_pf.png',
                    width: size.width * 0.5),
              ),
              //const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
