import 'package:flutter/material.dart';

import '../constant/AppColors.dart';
import '../constant/AppFonts.dart';

appDialog(BuildContext context, Widget child) {
  showDialog(
      context: context,
      useSafeArea: true,
      builder: (_) => AnimateDialog(
        childView: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppFonts.s16))),
          backgroundColor: AppColors.white,
          insetPadding: EdgeInsets.symmetric(horizontal: AppFonts.s16, vertical: AppFonts.s40),
          content: Container(
              width: double.maxFinite,
              child: child),
        ),
      )
  );
}





class AnimateDialog extends StatelessWidget {
  final Widget childView;
  const AnimateDialog({super.key,  required this.childView});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        tween: Tween<double>(begin: 0, end: 1),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.scale(
            scale: value,
            child: childView,
          );
        });
  }
}

