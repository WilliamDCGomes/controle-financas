import 'package:flutter/material.dart';
import 'package:flutter_project/2-app/views/pages/loginPage.dart';
import 'package:flutter_project/2-app/views/pages/registerPage.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  late final String appVersion;
  late Offset offset0;
  late Offset offset1;
  late Offset offset2;
  late Offset offset3;
  late Offset offset4;
  late Offset offset5;
  late Offset offset6;
  late Offset offset7;

  WelcomeController(){
    _loadAppVersion();
    offset0 = Offset.zero;
    offset1 = Offset.zero;
    offset2 = Offset.zero;
    offset3 = Offset.zero;
    offset4 = Offset.zero;
    offset5 = Offset.zero;
    offset6 = Offset.zero;
    offset7 = Offset.zero;
    _setFirstItemsPositionsToAnimation();
  }

  _setFirstItemsPositionsToAnimation() {
    offset0 += const Offset(-10, 0);
    offset1 += const Offset(10, 0);
    offset2 += const Offset(-10, 0);
    offset3 += const Offset(10, 0);
    offset4 += const Offset(-10, 0);
    offset5 += const Offset(10, 0);
    offset6 += const Offset(-10, 0);
    offset7 += const Offset(10, 0);
  }

  startAnimation() {
    offset0 += const Offset(10, 0);
    offset1 += const Offset(-10, 0);
    offset2 += const Offset(10, 0);
    offset3 += const Offset(-10, 0);
    offset4 += const Offset(10, 0);
    offset5 += const Offset(-10, 0);
    offset6 += const Offset(10, 0);
    offset7 += const Offset(-10, 0);
  }

  _loadAppVersion(){
    appVersion = "Versão 1.0";
  }

  googleButtonPressed(){

  }

  facebookButtonPressed(){

  }

  appleButtonPressed(){

  }

  accessButtonPressed(){
    Get.to(() => LoginPage());
  }

  registerButtonPressed(){
    Get.to(() => RegisterPage());
  }
}