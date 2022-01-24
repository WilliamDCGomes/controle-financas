import 'package:flutter/material.dart';
import 'package:flutter_project/2-app/views/pages/mainMenuPage.dart';
import 'package:flutter_project/2-app/views/pages/popups/forgetPasswordPopup.dart';
import 'package:flutter_project/2-app/views/pages/registerPage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController loginInput;
  late TextEditingController passwordInput;
  late RxBool passwordFieldEnabled;

  LoginController(){
    passwordFieldEnabled = true.obs;
    loginInput = TextEditingController();
    passwordInput = TextEditingController();
  }

  accessButtonPressed(){
    Get.offAll(MainMenuPage());
  }

  registerButtonPressed(){
    Get.to(() => RegisterPage());
  }

  forgetPasswordPressed(context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ForgetPasswordPopup();
      },
    );
  }
}