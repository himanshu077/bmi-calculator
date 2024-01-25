import 'package:bmi_calculator/components/constant/AppColors.dart';
import 'package:bmi_calculator/components/constant/AppFonts.dart';
import 'package:bmi_calculator/components/constant/constants.dart';
import 'package:bmi_calculator/components/coreComponents/TextView.dart';
import 'package:flutter/material.dart';
import 'package:speedometer_chart/speedometer_chart.dart';

import '../../components/appWidgets/AppBar2.dart';
import '../../components/constant/TextStyles.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
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
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
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
    minTextValue: '',
    maxTextValue: '',
    graphColor: [Colors.red, Colors.yellow, Colors.green],
    pointerColor: Colors.black,
    valueVisible: true,
    rangeVisible: true,
  );
}

Widget _detailView(){
  return Container(
    padding: EdgeInsets.all(AppFonts.s20),
    decoration: BoxDecoration(
      color: AppColors.white
    ),
    child: Column(
      children: [
        TextView(text: 'Guest'),


        Row(
          children: [
            Expanded(child: Column(children: [
              TextView(text: 'Your BMI is...'),

              TextView(text: '22.7'),
            ],)),
            Expanded(child: Column(children: [
              TextView(text: 'Status'),

              TextView(text: 'Normal'),
            ],))
          ],
        ),
        Divider(),
        Row(
          children: [
            _measureValueView(value: 'Gender'),
            _measureValueView(value: 'Age'),
            _measureValueView(value: 'Weight'),
            _measureValueView(value: 'Height'),

          ],
        )

      ],
    ),
  );
}

Widget _measureValueView({required String value}){
  return Expanded(child: TextView(text: value, textAlign: TextAlign.center,));
}
