import 'package:bmi_calculator/components/coreComponents/AppDialog.dart';
import 'package:bmi_calculator/components/coreComponents/AppLoader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// extension for Build context
extension ContextExten on BuildContext{

  // navigate to next screen
  void  pushNavigator(Widget screen) => Navigator.push(this, MaterialPageRoute(builder: (context) => screen,));

  // push and replace ......
  void  replaceNavigator(Widget screen) => Navigator.pushReplacement(this, MaterialPageRoute(builder: (context) => screen,));

  // clear stack and navigate to screen....
  void  pushAndClearNavigator(Widget screen) =>
      Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (context) => screen,), (route) => false);

  //pop back...
  void  pop() => Navigator.pop(this);


  void get load => appLoader(this);

  void get  stopLoader => Navigator.of(this,rootNavigator: false).pop('dialog');

  void openDialog(Widget child) => appDialog(this, child);

  bool get isPortraitMode => MediaQuery.of(this).orientation == Orientation.portrait;

}



// extension for String
extension StringExten on String{

  bool get isPassword{
    return length > 6 && length< 25;
  }

  String get clear => '';
}


// extension for RxString
extension RxStringExten on RxString{
  void get clear => value = '';
}


