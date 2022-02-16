import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../1-base/models/bill.dart';
import '../views/stylePages/appColors.dart';

class BillController extends GetxController {
  late Bill bill;
  late String firstTitleValueCard;
  late String firstValueCard;
  late String secondTitleValueCard;
  late String secondValueCard;
  late List<Color> gradientColor;

  BillController(this.bill){
    _getStatusBarColorOpen();
    _getCardInformations();
  }

  _getStatusBarColorOpen(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bill.getColor,
    ));
  }

  _getCardInformations(){
    if(bill.isInvestment ?? false){
      firstTitleValueCard = "Valor Guardado:";
      firstValueCard = "R\$ ${bill.getFormattedValueAlreadyHave}";
      secondTitleValueCard = "Meta:";
      secondValueCard = "R\$ ${bill.getFormattedValueWantAchieve}";
    }
    else if(bill.plots != null && bill.plots! > 1){
      firstTitleValueCard = "Para Pagar (${bill.plotsRemaining}):";
      firstValueCard = "R\$ ${bill.getFormattedValue}";
      secondTitleValueCard = "Pago (${bill.plotsPaid}/${bill.plots}):";
      secondValueCard = "R\$ ${bill.getFormattedValuePaid}";
    }
    else{
      firstTitleValueCard = "Para Pagar:";
      firstValueCard = "R\$ ${bill.getFormattedValue}";
      secondTitleValueCard = "Pago:";
      secondValueCard = "R\$ ${bill.getFormattedValuePaid}";
    }
  }

  getStatusBarColorClose(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors().standardColor,
    ));
  }
}