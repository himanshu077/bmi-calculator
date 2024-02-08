import 'package:bmi_calculator/components/constant/AppColors.dart';
import 'package:bmi_calculator/components/constant/AppFonts.dart';
import 'package:bmi_calculator/components/constant/AppIcons.dart';
import 'package:bmi_calculator/components/coreComponents/ImageView.dart';
import 'package:bmi_calculator/components/coreComponents/TextView.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';

import '../../components/appWidgets/AppBar2.dart';
import '../../components/constant/TextStyles.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppBar2(
              title: 'BMI History',
              titleStyle: TextStyles.semiBold16Black,
              onLeadTap: context.pop,
            ),
            Expanded(child: ListView.separated(
              padding: EdgeInsets.symmetric(vertical:AppFonts.s20, horizontal: AppFonts.s16),
              shrinkWrap: true,
                itemBuilder: (context, index) => _Card(
                  onRemove: (){

                  },
                ),
                separatorBuilder: (context, index) => SizedBox(height: AppFonts.s20,),
                itemCount: 10))
          ],
        ),
      ),
    );
  }
}



class _Card extends StatelessWidget {
  final Function() onRemove;
  const _Card({super.key, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:AppFonts.s16, horizontal: AppFonts.s12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppFonts.s10)
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    TextView(text: '26.7',textStyle: TextStyles.bold22Black,),
                    Expanded(child: TextView(text: '08-12-2023 12:00',textStyle: TextStyles.regular14TextGrey, textAlign: TextAlign.end,)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      width: AppFonts.s12,
                      height: AppFonts.s12,
                      decoration: BoxDecoration(
                        color: AppColors.primaryGreen,
                        borderRadius: BorderRadius.circular(AppFonts.s12 /2)
                      ),
                    ),
                    TextView(text: 'Normal',textStyle: TextStyles.regular14Black,),
                    Expanded(child: TextView(text: 'Guest',textStyle: TextStyles.regular14TextGrey, textAlign: TextAlign.end,)),
                  ],
                ),
              ],
            ),
          ),
          ImageView(
            onTap: onRemove,
            url: AppIcons.remove,
            size: AppFonts.s20,
            margin: EdgeInsets.only(left: AppFonts.s12),
          ),
          // SizedBox(
          //   width: 50,
          //   child: Row(
          //     children: [
          //
          //     ],
          //   ),
          // )
        ],
      )
      ,
    );
  }
}

