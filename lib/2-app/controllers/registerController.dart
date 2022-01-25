import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController nameInput;
  late TextEditingController lastNameInput;
  late TextEditingController emailInput;
  late TextEditingController userInput;
  late TextEditingController passwordInput;
  late TextEditingController confirmPasswordInput;
  late TextEditingController phoneInput;
  late TextEditingController cellphoneInput;
  late RxBool passwordFieldEnabled;
  late RxBool confirmPasswordFieldEnabled;

  RegisterController(){
    passwordFieldEnabled = true.obs;
    confirmPasswordFieldEnabled = true.obs;
    nameInput = TextEditingController();
    lastNameInput = TextEditingController();
    emailInput = TextEditingController();
    userInput = TextEditingController();
    passwordInput = TextEditingController();
    confirmPasswordInput = TextEditingController();
    phoneInput = TextEditingController();
    cellphoneInput = TextEditingController();
  }

  registerButtonPressed(){
    Get.back();
  }
}