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
  final Color orangeCardColor = Colors.orange;
  final Color greenCardColor = const Color(0XFF0F4722);
  final Color blueCardColor =const Color(0XFF0D3082);
  final Color purpleCardColor = const Color(0XFF79018B);
  final Color redCardColor = const Color(0XFFA10103);
  final Color greenColor = const Color(0XFF008001);
  final Color redColor = const Color(0XFFFF0000);
  final Color blueColor = const Color(0XFF0000FE);
  final Color navigationBarColor = const Color(0XFF0A0F35);
  final Color blackColor91Percent = const Color(0XFF919191);
  final Color standardColor = const Color(0XFF788990);
  final Color grayColor = const Color(0XFFE1E1E1);
  final Color yellowColor = const Color(0XFFFFEC01);
  final Color brightBlueColor = const Color(0XFF0079D9);
  final Color darkBlueColor = const Color(0XFF004373);
  final Color googleLogoBackgroundColor = const Color(0XFFD34836);
  final Color facebookLogoBackgroundColor = const Color(0XFF3B5998);
  final Color blueColorStatusBar = const Color(0XFF23305A);
  final Color redColorStatusBar = const Color(0XFF972321);
  final Color orangeColorStatusBar = const Color(0XFFF4CD94);
  final Color purpleColorStatusBar = const Color(0XFF824588);
  final Color greenColorStatusBar = const Color(0XFF326153);

  final List<Color> gradientColor = const [Color(0XFF484592), Color(0XFF619793)];
  final List<Color> investmentGradientColor = const [Color(0XFF67647F), Color(0XFF23305A)];
  final List<Color> alreadyPaidGradientColor = const [Color(0XFF588F7A), Color(0XFF326153)];
  final List<Color> futureBillGradientColor = const [Color(0XFFBC7FC3), Color(0XFF824588)];
  final List<Color> lateGradientColor = const [Color(0XFFCC7A80), Color(0XFF972321)];
  final List<Color> deadlineEndingGradientColor = const [Color(0XFFF4CD94), Color(0XFFC07931)];
}