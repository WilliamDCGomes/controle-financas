import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_project/2-app/controllers/welcomeController.dart';
import 'package:flutter_project/2-app/helpers/paths.dart';
import 'package:flutter_project/2-app/views/componentsWidgets/buttonWidget.dart';
import 'package:flutter_project/2-app/views/componentsWidgets/textWidget.dart';
import 'package:flutter_project/2-app/views/stylePages/appColors.dart';
import 'package:flutter_project/2-app/views/viewsWidgets/backgroundsWidget/welcomePageBackgroundWidget.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late WelcomeController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) {
      setState(() {
        controller.startAnimation();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(WelcomeController());
    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            WelcomePageBackgroundWidget(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.5.h),
                    child: Column(
                      children: [
                        AnimatedSlide(
                          offset: controller.offset0,
                          duration: const Duration(milliseconds: 600),
                          child: TextWidget(
                            "Comece a praticar agora!",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        AnimatedSlide(
                          offset: controller.offset1,
                          duration: const Duration(milliseconds: 750),
                          child: TextWidget(
                            "Faça o seu Login",
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.5.h),
                    child: AnimatedSlide(
                      offset: controller.offset2,
                      duration: const Duration(milliseconds: 900),
                      child: Stack(
                        children: [
                          ButtonWidget(
                            hintText: "ENTRAR COM GOOGLE",
                            fontWeight: FontWeight.bold,
                            widthButton: 75.w,
                            backgroundColor: AppColors().googleLogoBackgroundColor,
                            onPressed: (){
                              controller.googleButtonPressed();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.5.w, top: 1.25.h),
                            child: Image.asset(
                              "${Paths().imagesPath}googleLogo.png",
                              height: 3.5.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 3.5.h),
                      child: AnimatedSlide(
                        offset: controller.offset3,
                        duration: const Duration(milliseconds: 1050),
                        child: Stack(
                          children: [
                            ButtonWidget(
                              hintText: "ENTRAR COM FACEBOOK",
                              fontWeight: FontWeight.bold,
                              widthButton: 75.w,
                              backgroundColor: AppColors().facebookLogoBackgroundColor,
                              onPressed: (){
                                controller.facebookButtonPressed();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.6.w, top: 1.25.h),
                              child: Image.asset(
                                "${Paths().imagesPath}faceLogo.png",
                                height: 3.5.h,
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.5.h),
                    child: AnimatedSlide(
                      offset: controller.offset4,
                      duration: const Duration(milliseconds: 1200),
                      child: Stack(
                        children: [
                          ButtonWidget(
                            hintText: "ENTRAR COM APPLE",
                            fontWeight: FontWeight.bold,
                            textColor: AppColors().blackColor,
                            widthButton: 75.w,
                            backgroundColor: AppColors().grayColor,
                            onPressed: (){
                              controller.appleButtonPressed();
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 3.2.w, top: 1.h),
                            child: Image.asset(
                              "${Paths().imagesPath}appleLogo.png",
                              height: 3.5.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.5.h),
                    child: AnimatedSlide(
                      offset: controller.offset5,
                      duration: const Duration(milliseconds: 1350),
                      child: ButtonWidget(
                        hintText: "ACESSAR",
                        fontWeight: FontWeight.bold,
                        widthButton: 75.w,
                        backgroundColor: AppColors().brightBlueColor,
                        onPressed: (){
                          controller.accessButtonPressed();
                        },
                      ),
                    ),
                  ),
                  AnimatedSlide(
                    offset: controller.offset6,
                    duration: const Duration(milliseconds: 1500),
                    child: ButtonWidget(
                      hintText: "CADASTRAR",
                      fontWeight: FontWeight.bold,
                      widthButton: 75.w,
                      backgroundColor: AppColors().darkBlueColor,
                      onPressed: (){
                        controller.registerButtonPressed();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 1.h),
                  child: AnimatedSlide(
                    offset: controller.offset7,
                    duration: const Duration(milliseconds: 1650),
                    child: TextWidget(
                      controller.appVersion,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}