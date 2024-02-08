import 'package:bmi_calculator/components/appWidgets/AppBar2.dart';
import 'package:bmi_calculator/components/appWidgets/dialog/FailureMessageDialog.dart';
import 'package:bmi_calculator/components/constant/AppColors.dart';
import 'package:bmi_calculator/components/constant/AppFonts.dart';
import 'package:bmi_calculator/components/constant/TextStyles.dart';
import 'package:bmi_calculator/components/coreComponents/TextView.dart';
import 'package:bmi_calculator/presentation/auth/LoginCtrl.dart';
import 'package:bmi_calculator/presentation/auth/LoginView.dart';
import 'package:bmi_calculator/presentation/home/ProfileCtrl.dart';
import 'package:bmi_calculator/utils/AppExtenstions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MeasurementsView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ViewStateMixin{
  final profileCtrl = Get.put(ProfileCtrl());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onCreate();
    });
  }

  void onCreate() async{
    load();
    await profileCtrl.getProfile().then((value) {
      stopLoad();
    }).catchError((error){
      stopLoad();
      onError(error);
    });


  }
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
                  profileCtrl.onLogout();
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

  @override
  void load() {
    context.load;
  }

  @override
  void onError(String error) {
    context.openDialog(FailureMessageDailog(
        message: error,
      dismiss: stopLoad,
      onTap: stopLoad,
    ));
  }

  @override
  void stopLoad() {
    context.stopLoader;
  }
}


