import 'package:financas_controle/2-app/controllers/loginController.dart';
import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:financas_controle/2-app/helpers/phoneTablet.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/buttonWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textFieldWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(LoginController());

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppColors().standardColor,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: PhoneTablet().isPhone(context) ? 7.h : 5.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${Paths().imagesPath}imagemBackgroundLogin.png",
                        height: 25.h,
                        width: 80.w,
                        cacheHeight: 750,
                        cacheWidth: 1200,
                      ),
                    ],
                  ),
                ),
                Scaffold(
                  backgroundColor: AppColors().transparentColor,
                  appBar: AppBar(
                    title: TextWidget(
                      "Login",
                      textColor: AppColors().whiteColor,
                    ),
                    backgroundColor: AppColors().standardColor,
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextWidget(
                                "FAÇA O LOGIN",
                                textColor: AppColors().whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: TextFieldWidget(
                                  controller: controller.loginInput,
                                  hintText: "Digite seu login",
                                  width: 75.w,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.5.h),
                                child: Obx(
                                      () => TextFieldWidget(
                                    controller: controller.passwordInput,
                                    hintText: "Digite sua senha",
                                    width: 75.w,
                                    isPassword: controller.passwordFieldEnabled.value,
                                    iconTextField: GestureDetector(
                                      onTap: () {
                                        controller.passwordFieldEnabled.value =
                                        !controller.passwordFieldEnabled.value;
                                      },
                                      child: Icon(
                                        controller.passwordFieldEnabled.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: AppColors().whiteColor,
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: ButtonWidget(
                                  onPressed: (){
                                    controller.accessButtonPressed();
                                  },
                                  textColor: AppColors().whiteColor,
                                  backgroundColor: AppColors().greenColor,
                                  hintText: "LOGAR",
                                  fontWeight: FontWeight.bold,
                                  radioButton: 1.h,
                                  widthButton: 75.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.5.h),
                                child: ButtonWidget(
                                  onPressed: (){
                                    controller.registerButtonPressed();
                                  },
                                  textColor: AppColors().whiteColor,
                                  backgroundColor: AppColors().blueColor,
                                  hintText: "CADASTRAR",
                                  fontWeight: FontWeight.bold,
                                  radioButton: 1.h,
                                  widthButton: 75.w,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child:
                                SizedBox(
                                  width: 75.w,
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.forgetPasswordPressed(context);
                                    },
                                    child: TextWidget(
                                      "Esqueci a senha?",
                                      textColor: AppColors().whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      textAlign: TextAlign.end,
                                      textDecoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}