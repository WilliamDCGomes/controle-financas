import 'dart:io';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String _text;
  final int? maxLines;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundTextColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;

  TextWidget(
      this._text,
      {
        Key? key,
        this.maxLines,
        this.textColor,
        this.backgroundTextColor,
        this.textAlign,
        this.fontSize,
        this.fontWeight,
        this.textOverflow,
        this.textDecoration,
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      style: TextStyle(
        color: textColor ?? AppColors().whiteColor,
        backgroundColor: backgroundTextColor,
        fontSize: fontSize ?? (Platform.isAndroid ? 20 : 35),
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: textDecoration,
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}