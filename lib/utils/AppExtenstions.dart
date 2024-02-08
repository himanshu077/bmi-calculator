import 'package:flutter/material.dart';


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

}