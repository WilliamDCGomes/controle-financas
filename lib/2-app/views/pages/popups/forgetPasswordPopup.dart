import 'package:financas_controle/2-app/controllers/popupsController/forgetPasswordPopupController.dart';
import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/buttonLoadingWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textFieldWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPasswordPopup extends StatefulWidget {
  const ForgetPasswordPopup({
    Key? key,
  }) : super(key: key);

  @override
  _ForgetPasswordPopupState createState() => _ForgetPasswordPopupState();
}

class _ForgetPasswordPopupState extends State<ForgetPasswordPopup> {
  late ForgetPasswordPopupController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(ForgetPasswordPopupController());

    return Dialog(
      backgroundColor: AppColors().standardColor,
      insetPadding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5.h),
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          width: 75.w,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(2.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 2.5.h),
                        child: TextWidget(
                          "Redefinir Senha",
                          textColor: AppColors().whiteColor,
                          fontSize: 3.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        "${Paths().imagesPath}resetPasswordIcon.png",
                        height: 15.h,
                        opacity: AlwaysStoppedAnimation<double>(0.8),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Obx(() => controller.messageVisible.value ?
                        SizedBox(
                          height: 5.h,
                          child: TextWidget(
                            controller.messageStatus.value,
                            textColor: !controller.emailSucess.value ?
                            AppColors().redColor : AppColors().greenColor,
                            backgroundTextColor: Color.fromRGBO(255, 255, 255, 0.4),
                            fontSize: 2.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ) :
                        SizedBox(
                          height: 5.h,
                        ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Obx(
                              () => TextFieldWidget(
                            controller: controller.emailInput,
                            justRead: controller.emailFieldEnabled.value,
                            hintText: "Informe o seu E-mail",
                            borderColor: controller.emailSucess.value ?
                            AppColors().greenColor :
                            controller.emailError.value ?
                            AppColors().redColor : null,
                            width: 80.w,
                            iconTextField: Icon(
                              Icons.email,
                              color: AppColors().whiteColor,
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h,bottom: 2.h),
                        child: ButtonLoadingWidget(
                          widthButton: 80.w,
                          controller: controller.sendEmailButton,
                          color: AppColors().redColor,
                          borderRadius: 1.h,
                          onPressed: () async {
                            controller.sendEmail(context);
                          },
                          textColor: AppColors().whiteColor,
                          valueColor: AppColors().whiteColor,
                          hintText: "ENVIAR",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 15),
                child: GestureDetector(
                  onTap: (){
                    controller.closePopup();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.close,
                        color: AppColors().whiteColor,
                        size: 4.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}