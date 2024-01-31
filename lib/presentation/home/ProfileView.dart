import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';

import '../../components/appWidgets/AppBar2.dart';
import '../../components/constant/AppFonts.dart';
import '../../components/constant/TextStyles.dart';
import '../../components/coreComponents/AppButton.dart';
import '../../components/coreComponents/EditText.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar2(
              title: 'Profile',
              titleStyle: TextStyles.semiBold16Black,
              onLeadTap: context.pop,
            ),

            Padding(
              padding: const EdgeInsets.all(AppFonts.s20),
              child: Column(
                children: [
                  EditText(
                    hint: 'Your Full Name',
                    controller: TextEditingController(),
                  ),
                  EditText(
                    hint: 'Email Address',
                    controller: TextEditingController(),
                    margin: const EdgeInsets.only(top: AppFonts.s16, bottom: AppFonts.s40),
                  ),
                  AppButton(
                    label: 'Update',
                    onTap: (){
                      context.pop();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
