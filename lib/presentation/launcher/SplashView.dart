import 'package:bmi_calculator/presentation/auth/LoginView.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';

import '../../components/constant/TextStyles.dart';
import '../../components/coreComponents/TextView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onCreate();
  }

  void onCreate(){
    Future.delayed(const Duration(seconds: 3),(){
      context.pushNavigator(const LoginView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(text: 'BMI',textStyle: TextStyles.bold40PrimaryGreen,),
            TextView(text: 'Calculator',textStyle: TextStyles.bold40PrimaryGreen,),
          ],
        ),
      ),
    );
  }
}
