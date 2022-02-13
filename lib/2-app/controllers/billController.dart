import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../1-base/models/bill.dart';
import '../views/stylePages/appColors.dart';

class BillController extends GetxController {
  late Bill bill;

  BillController(this.bill){
    _getStatusBarColorOpen();
  }

  _getStatusBarColorOpen(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bill.getColor,
    ));
  }

  getStatusBarColorClose(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors().standardColor,
    ));
  }
}