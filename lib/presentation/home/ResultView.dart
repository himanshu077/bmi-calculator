import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

import '../../components/appWidgets/AppBar2.dart';
import '../../components/constant/AppColors.dart';
import '../../components/constant/AppFonts.dart';
import '../../components/constant/TextStyles.dart';
import '../../components/coreComponents/TextView.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBar2(
              title: 'BMI Calculator',
              titleStyle: TextStyles.semiBold16Black,
              onLeadTap: context.pop,
            ),
            Expanded(child: SingleChildScrollView(
              padding: EdgeInsets.all(AppFonts.s20),
              child: Column(
                children: [
                  const SizedBox(height: AppFonts.s40,),
                  _meterView(),
                  _detailView(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
Widget _meterView(){
  return SpeedometerChart(
    dimension: 200,
    minValue: 16,
    maxValue: 50,
    value: 24,
    // minTextValue: '',
    // maxTextValue: '',
    graphColor: [Colors.red, Colors.yellow, Colors.green],
    pointerColor: Colors.black,
    valueVisible: false,
    rangeVisible: false,
  );
}

Widget _detailView(){
  return Container(
    margin: EdgeInsets.only(top: AppFonts.s40),
    padding: EdgeInsets.symmetric(vertical: AppFonts.s20),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppFonts.s10)
    ),
    child: Column(
      children: [
        const TextView(text: 'Guest', textStyle: TextStyles.semiBold16Black,margin: EdgeInsets.only(bottom: AppFonts.s16),),


        const Row(
          children: [
           Expanded(child: Column(children: [
              TextView(text: 'Your BMI is...', textStyle: TextStyles.medium14Black,),

              TextView(text: '22.7', textStyle: TextStyles.bold30Black,),
            ],)),
            Expanded(child: Column(children: [
              TextView(text: 'Status', textStyle: TextStyles.medium14Black,),
              TextView(text: 'Normal', textStyle: TextStyles.semiBold16P_Green),
            ],))
          ],
        ),
        const Divider(),
        IntrinsicHeight(
          child: Row(
            children: [
              _measureValueView(value: 'Gender'),
              const VerticalDivider(),
              _measureValueView(value: 'Age'),
              const VerticalDivider(),
              _measureValueView(value: 'Weight'),
              const VerticalDivider(),
              _measureValueView(value: 'Height'),

            ],
          ),
        )

      ],
    ),
  );
}

Widget _measureValueView({required String value}){
  return Expanded(child: TextView(text: value, textAlign: TextAlign.center, textStyle: TextStyles.regular14Black));
}
