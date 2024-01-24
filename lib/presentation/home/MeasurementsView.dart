import 'package:bmi_calculator/components/constant/AppColors.dart';
import 'package:flutter/material.dart';

import '../../components/constant/AppFonts.dart';
import '../../components/constant/AppIcons.dart';
import '../../components/coreComponents/AppButton.dart';
import '../../components/coreComponents/ImageView.dart';

class MeasurementsView extends StatefulWidget {
  const MeasurementsView({super.key});

  @override
  State<MeasurementsView> createState() => _MeasurementsViewState();
}

class _MeasurementsViewState extends State<MeasurementsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _GenderButton(
              icon: AppIcons.male,
              status: true,
              onTap: (){},
            ),
            _GenderButton(
              icon: AppIcons.female,
              status: false,
              onTap: (){},
            )
          ],
        )
      ],
    );
  }
}


class _GenderButton extends StatelessWidget {
  final String icon;
  final bool status;
  final Function() onTap;
  const _GenderButton({super.key, required this.icon, required this.status, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      fillWidth: false,
      buttonColor: status ? AppColors.primaryGreen : AppColors.grey50,
      child: ImageView(url: icon, size: AppFonts.s10,),
    );
  }
}






