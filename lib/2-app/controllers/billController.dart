import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../1-base/models/bill.dart';
import '../enums/enums.dart';
import '../views/stylePages/appColors.dart';

class BillController extends GetxController {
  late Bill bill;

  BillController(this.bill);
}