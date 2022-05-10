import 'package:comunidadefreiriana/app.dart';
<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const App();
  }
}
>>>>>>> ba547f44962d22836cc6e30ad9a0950426162ba0
