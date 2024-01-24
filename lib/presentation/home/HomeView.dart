import 'package:bmi_calculator/components/appWidgets/AppBar2.dart';
import 'package:bmi_calculator/components/constant/TextStyles.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            const AppBar2(
              isLeadVisible: false,
              title: 'BMI Calculator',
              titleStyle: TextStyles.semiBold16Black,
            ),
            Expanded(child: MeasurementsView()),
          ],
        ),
      ),
    );
  }
}


