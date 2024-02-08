import 'package:bmi_calculator/presentation/Launcher/SplashView.dart';
import 'package:bmi_calculator/services/firebase/FirebaseService.dart';
import 'package:flutter/material.dart';

void main() async {
  await initConfig();
  runApp(const MyApp());
}

Future<void> initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  return;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
