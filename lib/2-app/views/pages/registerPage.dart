import 'package:flutter/material.dart';
import 'package:flutter_project/2-app/controllers/registerController.dart';
import 'package:flutter_project/2-app/views/componentsWidgets/buttonWidget.dart';
import 'package:flutter_project/2-app/views/componentsWidgets/textFieldWidget.dart';
import 'package:flutter_project/2-app/views/componentsWidgets/textWidget.dart';
import 'package:flutter_project/2-app/views/stylePages/appColors.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(RegisterController());

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            backgroundColor: AppColors().backgroundStandardColor,
            appBar: AppBar(
              title: TextWidget(
                "Cadastro de Usuário",
                textColor: AppColors().whiteColor,
              ),
              backgroundColor: AppColors().backgroundStandardColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 2.h, right: 5.w),
                    child: TextWidget(
                      "Insira suas informações",
                      textColor: AppColors().whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w, top: 1.h, right: 5.w),
                    child: Container(
                      height: 1,
                      width: 95.w,
                      color: AppColors().whiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.5.h),
                            child: TextFieldWidget(
                              controller: controller.nameInput,
                              hintText: "Nome",
                              width: 75.w,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.lastNameInput,
                              hintText: "Sobrenome",
                              width: 75.w,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.emailInput,
                              hintText: "E-mail",
                              width: 75.w,
                              iconTextField: Icon(
                                Icons.email,
                                color: AppColors().blackColor91Percent,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.userInput,
                              hintText: "Usuário",
                              width: 75.w,
                              iconTextField: Icon(
                                Icons.person_sharp,
                                color: AppColors().blackColor91Percent,
                              ),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Obx(() => TextFieldWidget(
                              controller: controller.passwordInput,
                              hintText: "Senha",
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
                                  color: AppColors().blackColor91Percent,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Obx(() => TextFieldWidget(
                              controller: controller.confirmPasswordInput,
                              hintText: "Confirmar senha",
                              width: 75.w,
                              isPassword: controller.confirmPasswordFieldEnabled.value,
                              iconTextField: GestureDetector(
                                onTap: () {
                                  controller.confirmPasswordFieldEnabled.value =
                                  !controller.confirmPasswordFieldEnabled.value;
                                },
                                child: Icon(
                                  controller.confirmPasswordFieldEnabled.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColors().blackColor91Percent,
                                ),
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.collegeNameInput,
                              hintText: "Nome da Faculdade",
                              width: 75.w,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.courseNameInput,
                              hintText: "Nome do Curso",
                              width: 75.w,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.phoneInput,
                              hintText: "Telefone",
                              width: 75.w,
                              iconTextField: Icon(
                                Icons.phone,
                                color: AppColors().blackColor91Percent,
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: TextFieldWidget(
                              controller: controller.cellphoneInput,
                              hintText: "Celular",
                              width: 75.w,
                              iconTextField: Icon(
                                Icons.phone_android,
                                color: AppColors().blackColor91Percent,
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
                        child: ButtonWidget(
                          onPressed: (){
                            controller.registerButtonPressed();
                          },
                          textColor: AppColors().whiteColor,
                          backgroundColor: AppColors().greenColor,
                          hintText: "CADASTRAR",
                          fontWeight: FontWeight.bold,
                          radioButton: 1.h,
                          widthButton: 75.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}