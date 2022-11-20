import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../1-base/models/bill.dart';
import '../enums/enums.dart';
import '../views/stylePages/appColors.dart';

class BillController extends GetxController {
  late Bill bill;
  late String firstTitleValueCard;
  late String firstValueCard;
  late String secondTitleValueCard;
  late String secondValueCard;
  late bool hasPlots;
  late int _plotOnScreen;
  late List<Color> gradientColor;
  late List<Widget> PlotBillList;
  late CarouselController carouselController;

  BillController(this.bill){
    _getStatusBarColorOpen();
    _getCardInformations();
    _hasPlots();
    _initializeVariables();
  }

  _getStatusBarColorOpen(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: bill.getStatusBarColor,
    ));
  }

  _getCardInformations(){
    if(bill.statusBill != null && bill.statusBill == StatusBill.investment){
      firstTitleValueCard = "Objetivo:";
      firstValueCard = "R\$ ${bill.getFormattedValueAlreadyHave}";
      secondTitleValueCard = "Valor Atual:";
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

  _hasPlots(){
      hasPlots = (bill.plots ?? 0) > 1;
  }

  _initializeVariables(){
    carouselController = CarouselController();
    _plotOnScreen = 1;
  }

  getStatusBarColorClose(){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors().standardColor,
    ));
  }

  nextBill() async {
    await carouselController.onReady;
    if(_plotOnScreen < (bill.plots ?? 1)){
      carouselController.nextPage();
      _getCardInformations();
      _plotOnScreen++;
    }
  }

  previewsBill() async {
    await carouselController.onReady;
    if(_plotOnScreen > 1) {
      carouselController.previousPage();
      _getCardInformations();
      _plotOnScreen--;
    }
  }
}