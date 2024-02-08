import 'package:bmi_calculator/components/constant/AppFonts.dart';
import 'package:bmi_calculator/components/constant/TextStyles.dart';
import 'package:bmi_calculator/components/coreComponents/AppButton.dart';
import 'package:bmi_calculator/components/coreComponents/EditText.dart';
import 'package:bmi_calculator/components/coreComponents/TextView.dart';
import 'package:bmi_calculator/presentation/home/HomeView.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        minimum: const EdgeInsets.all(AppFonts.s20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextView(text: 'Login', textStyle: TextStyles.semiBold30P_Green,
            margin: EdgeInsets.only(bottom: AppFonts.s40 * 1.5),
            ),

            EditText(
              hint: 'Enter your email address',
                controller: TextEditingController(),
            ),
            EditText(
              hint: 'Enter your password',
                controller: TextEditingController(),
              margin: const EdgeInsets.only(top: AppFonts.s16, bottom: AppFonts.s40),
            ),

            AppButton(
              label: 'LOGIN',
              onTap: (){
                context.pushAndClearNavigator(const HomeView());
              },
            )
          ],
        ),
      ),
    );
  }
}
