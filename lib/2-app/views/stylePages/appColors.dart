

import 'package:flutter/material.dart';

class AppColors {
  static final AppColors _appColors = AppColors._internal();
  factory AppColors() {
    return _appColors;
  }
  AppColors._internal();

  final Color whiteColor = Colors.white;
  final Color blackColor = Colors.black;
  final Color transparentColor = Colors.transparent;
  final Color greenCardColor = const Color(0XFF0F4722);
  final Color blueCardColor =const Color(0XFF0D3082);
  final Color purpleCardColor = const Color(0XFF79018B);
  final Color orangeCardColor = Colors.orange;
  final Color redCardColor = const Color(0XFFA10103);
  final Color greenColor = const Color(0XFF008001);
  final Color redColor = const Color(0XFFFF0000);
  final Color blueColor = const Color(0XFF0000FE);
  final Color navigationBarColor = const Color(0XFF0A0F35);
  final Color statusBarColor = const Color(0XFF0A0F37);
  final Color blackColor91Percent = const Color(0XFF919191);
  final Color backgroundStandardColor = const Color(0XFF0D1418);
  final Color grayColor = const Color(0XFFE1E1E1);
  final Color brightBlueColor = const Color(0XFF0079D9);
  final Color darkBlueColor = const Color(0XFF004373);
  final Color googleLogoBackgroundColor = const Color(0XFFD34836);
  final Color facebookLogoBackgroundColor = const Color(0XFF3B5998);
}