import 'package:financas_controle/2-app/helpers/phoneTablet.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class MenuOptionsWidget extends StatelessWidget {
  final String text;
  final Icon icon;
  final double? widthButton;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final List<Color>? colors;
  final Function()? onPressed;

  const MenuOptionsWidget(
      { Key? key,
        required this.text,
        required this.icon,
        this.widthButton,
        this.textSize,
        this.fontWeight,
        this.textColor,
        this.colors,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 12.h,
        width: 13.h,
        color: AppColors().transparentColor,
        child: Column(
          children: [
            Center(child: icon),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: TextWidget(
                  text,
                  textColor: textColor ?? AppColors().whiteColor,
                  fontSize: textSize ?? (PhoneTablet().isPhone(context) ?
                  16.sp : 14.sp),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}