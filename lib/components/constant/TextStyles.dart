import 'package:flutter/material.dart';

import 'AppColors.dart';
import 'AppFonts.dart';

class Family{
  static const String regular = "Poppins-Regular";
  static const String medium = "Poppins-Medium";
  static const String semiBold = "Poppins-SemiBold";
  static const String bold = "Poppins-Bold";
  static const String extraBold = "Poppins-ExtraBold";
}

class TextStyles{
  //Regular
  static const TextStyle regular10Black = TextStyle(color: AppColors.black, fontSize: AppFonts.s11, fontFamily: Family.regular);
  static const TextStyle regular14Black = TextStyle(color: AppColors.black, fontSize: AppFonts.s14, fontFamily: Family.regular);
  static const TextStyle regularTextHint = TextStyle(color: AppColors.grey50, fontSize: AppFonts.s14, fontFamily: Family.regular);

  //medium
  static const TextStyle medium10Black = TextStyle(color: AppColors.black, fontSize: AppFonts.s10, fontFamily: Family.medium);
  static const TextStyle medium14White = TextStyle(color: AppColors.white, fontSize: AppFonts.s14, fontFamily: Family.medium);


  //SemiBold
  static const TextStyle semiBold12P_Green = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s12, fontFamily: Family.semiBold);
  static const TextStyle semiBold16Black = TextStyle(color: AppColors.black, fontSize: AppFonts.s16, fontFamily: Family.semiBold);
  static const TextStyle semiBold30P_Green = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s30, fontFamily: Family.semiBold);


  //Bold
  static const TextStyle bold10PrimaryGreen = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s10, fontFamily: Family.bold);

  static const TextStyle bold30PrimaryGreen = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s30, fontFamily: Family.bold);

  static const TextStyle bold40PrimaryGreen = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s40, fontFamily: Family.bold);

  //extra Bold
  static const TextStyle extraBold10PrimaryGreen = TextStyle(color: AppColors.primaryGreen, fontSize: AppFonts.s10, fontFamily: Family.extraBold);
}