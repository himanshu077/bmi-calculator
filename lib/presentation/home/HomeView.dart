import 'package:bmi_calculator/components/appWidgets/AppBar2.dart';
import 'package:bmi_calculator/components/constant/AppColors.dart';
import 'package:bmi_calculator/components/constant/AppFonts.dart';
import 'package:bmi_calculator/components/constant/TextStyles.dart';
import 'package:bmi_calculator/components/coreComponents/TextView.dart';
import 'package:bmi_calculator/presentation/auth/LoginView.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';

import 'MeasurementsView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
             AppBar2(
              isLeadVisible: false,
              title: 'BMI Calculator',
              titleStyle: TextStyles.semiBold16Black,
              tail: TextView(
                onTap: (){
                  context.pushAndClearNavigator(const LoginView());
                },
                text: 'Logout', textStyle: TextStyles.semiBold16P_Green,),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(AppFonts.s10),
              child: MeasurementsView(),
            )),
          ],
        ),
      ),
    );
  }
}


