import 'package:flutter/material.dart';

class PhoneTablet{
  static final PhoneTablet _phoneTablet = PhoneTablet._internal();
  factory PhoneTablet() {
    return _phoneTablet;
  }
  PhoneTablet._internal();

  bool isPhone(context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }
}