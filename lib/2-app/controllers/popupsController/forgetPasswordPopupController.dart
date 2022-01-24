import 'package:email_validator/email_validator.dart';
import 'package:financas_controle/2-app/helpers/internetConnection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ForgetPasswordPopupController extends GetxController {
  late RxBool emailError;
  late RxBool emailSucess;
  late RxBool messageVisible;
  late RxBool emailFieldEnabled;
  late RxString messageStatus;
  late TextEditingController emailInput;
  late final RoundedLoadingButtonController sendEmailButton;

  ForgetPasswordPopupController(){
    emailError = false.obs;
    emailSucess = false.obs;
    messageVisible = false.obs;
    emailFieldEnabled = false.obs;
    messageStatus = "".obs;
    emailInput = TextEditingController();
    sendEmailButton = RoundedLoadingButtonController();
  }

  sendEmail(context) async {
    emailError.value = false;
    messageVisible.value = false;
    emailFieldEnabled.value = true;
    if (!await InternetConnection().checkConnection()) {
      messageVisible.value = true;
      emailFieldEnabled.value = false;
      messageStatus.value = "Você não está conectado a internet";
      sendEmailButton.stop();
    }
    else if (emailInput.text.isEmpty) {
      emailError.value = true;
      messageVisible.value = true;
      emailFieldEnabled.value = false;
      messageStatus.value = "Preencha o seu E-mail";
      sendEmailButton.stop();
    }
    else if (!EmailValidator.validate(emailInput.text)){
      emailError.value = true;
      messageVisible.value = true;
      emailFieldEnabled.value = false;
      messageStatus.value = "E-mail informado não é válido";
      sendEmailButton.stop();
    }
    else{
      /*RetornoService? esqueciSenha = await LoginService().enviaEmailEsqueciSenha(emailController.text);
      if (esqueciSenha != null && esqueciSenha.sucesso!) {*/
      messageVisible.value = true;
      emailSucess.value = true;
      messageStatus.value = "E-mail de redefinição enviado com sucesso";
      sendEmailButton.success();
      /*}
      else {
        messageVisible.value = true;
        emailFieldEnabled.value = false;
        messageStatus.value = "E-mail não enviado";
        sendEmailButton.stop();
      }*/
    }
  }

  closePopup(){
    _resetScreen();
    Get.back();
  }

  _resetScreen(){
    messageStatus = "".obs;
    emailError = false.obs;
    emailSucess = false.obs;
    messageVisible = false.obs;
    emailFieldEnabled = false.obs;
    emailInput.clear();
  }
}