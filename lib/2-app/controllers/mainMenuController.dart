import 'dart:math';
import 'package:financas_controle/1-base/models/bill.dart';
import 'package:financas_controle/2-app/enums/enums.dart';
import 'package:get/get.dart';
import '../views/pages/billPage.dart';

class MainMenuController extends GetxController {
  late String nameUser;
  late String nameInitials;
  late RxBool hasPicture;
  late RxDouble billToPay;
  late RxDouble billPaid;
  late RxDouble amountYouHave;
  late RxString welcomePhrase;
  late final List<Bill> fixedBills;
  late final List<Bill> periodicExpenses;
  late final List<Bill> billsAlreadyPaid;
  late final List<Bill> notPaidYet;

  MainMenuController(){
    _startVariables();
    _getFixedBills();
    _getNameUser();
    _getNameInitials();
    _getWelcomePhrase();
  }

  _startVariables(){
    hasPicture = false.obs;
    billToPay = 0.0.obs;
    billPaid = 0.0.obs;
    amountYouHave = 0.0.obs;
    fixedBills = <Bill>[];
    periodicExpenses = <Bill>[];
    billsAlreadyPaid = <Bill>[];
    notPaidYet = <Bill>[];
  }

  _getFixedBills(){
    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      switch(i){
        case 0:
          bill.billCode = 1;
          bill.billName = "Faculdade";
          bill.statusBill = StatusBill.alreadyPaid;
          bill.billValue = 743.59;
          break;
        case 1:
          bill.billCode = 2;
          bill.billName = "Pós";
          bill.statusBill = StatusBill.late;
          bill.billValue = 360;
          break;
        case 2:
          bill.billCode = 3;
          bill.billName = "LpNet";
          bill.statusBill = StatusBill.deadlineEnding;
          bill.billValue = 110;
          break;
        case 3:
          bill.billCode = 4;
          bill.billName = "Netflix";
          bill.statusBill = StatusBill.alreadyPaid;
          bill.billValue = 25.9;
          break;
        case 4:
          bill.billCode = 5;
          bill.billName = "Amazon";
          bill.statusBill = StatusBill.late;
          bill.billValue = 9.9;
          break;
      }
      bill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));
      bill.fixedBill = true;
      fixedBills.add(bill);
    }

    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      switch(i){
        case 0:
          bill.billCode = 6;
          bill.billName = "Will Bank";
          bill.statusBill = StatusBill.late;
          bill.billValue = 54.82;
          break;
        case 1:
          bill.billCode = 7;
          bill.fixedBill = true;
          bill.billName = "Nubank";
          bill.statusBill = StatusBill.deadlineEnding;
          bill.billValue = 274.27;
          break;
        case 2:
          bill.billCode = 8;
          bill.fixedBill = true;
          bill.billName = "Credicard";
          bill.billValue = 25004.47;
          break;
        case 3:
          bill.billCode = 9;
          bill.billName = "Havan";
          bill.statusBill = StatusBill.late;
          bill.billValue = 307.54;
          bill.plots = 10;
          bill.plotsPaid = 4;
          break;
        case 4:
          bill.billCode = 10;
          bill.billName = "Curso de Inglês";
          bill.statusBill = StatusBill.deadlineEnding;
          bill.billValue = 206;
          break;
      }
      bill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));
      periodicExpenses.add(bill);
    }

    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      switch(i){
        case 0:
          bill.billCode = 1;
          bill.fixedBill = true;
          bill.billName = "Faculdade";
          bill.billValue = 743.59;
          break;
        case 1:
          bill.billCode = 4;
          bill.fixedBill = true;
          bill.billName = "Netflix";
          bill.billValue = 25.9;
          break;
        case 2:
          bill.billCode = 8;
          bill.billName = "Credicard";
          bill.billValue = 25004.47;
          break;
        case 3:
          bill.billCode = 11;
          bill.billName = "Meu Vivo";
          bill.billValue = 42;
          break;
        case 4:
          bill.billCode = 12;
          bill.billName = "Spotify";
          bill.billValue = 19.90;
          break;
      }
      bill.statusBill = StatusBill.alreadyPaid;
      bill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));
      billsAlreadyPaid.add(bill);
    }

    Bill investmentBill = Bill();
    investmentBill.billCode = 14;
    investmentBill.billName = "Canadá";
    investmentBill.statusBill = StatusBill.investment;
    investmentBill.billValue = 200;
    investmentBill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));

    Bill futureBill = Bill();
    futureBill.billCode = 15;
    futureBill.billName = "Nutricionista";
    futureBill.statusBill = StatusBill.futureBill;
    futureBill.billValue = 400;
    futureBill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));
    notPaidYet.add(investmentBill);
    notPaidYet.add(futureBill);

    for(int i = 0; i < 5; i++){
      Bill bill = Bill();
      switch(i){
        case 0:
          bill.billCode = 2;
          bill.billName = "Pós";
          bill.fixedBill = true;
          bill.billValue = 360;
          break;
        case 1:
          bill.billCode = 5;
          bill.billName = "Amazon";
          bill.fixedBill = true;
          bill.billValue = 9.9;
          break;
        case 2:
          bill.billCode = 6;
          bill.billName = "Will Bank";
          bill.billValue = 54.82;
          break;
        case 3:
          bill.billCode = 9;
          bill.billName = "Havan";
          bill.billValue = 307.54;
          break;
        case 4:
          bill.billCode = 13;
          bill.billName = "Academia";
          bill.fixedBill = true;
          bill.billValue = 99;
          break;
      }
      bill.statusBill = StatusBill.late;
      bill.billDate = DateTime.now().add(Duration(days: Random().nextInt(50) - 20));
      notPaidYet.add(bill);
    }
  }

  _getNameUser(){
    nameUser = "Will";
  }

  _getNameInitials(){
    nameInitials = "WG";
  }

  _getWelcomePhrase(){
    int currentHour = DateTime.now().hour;
    if(currentHour >= 0 && currentHour < 12)
      welcomePhrase = "Bom dia!".obs;
    else if(currentHour >= 12 && currentHour < 18)
      welcomePhrase = "Boa tarde!".obs;
    else
      welcomePhrase = "Boa noite!".obs;
  }

  openBill(Bill billToOpen){
    Get.to(BillPage(billToOpen));
  }

  //#region Encapsulation
  get getFormattedValueBillToPay {
    return billToPay.toStringAsFixed(2).replaceAll('.', ',');
  }

  get getFormattedValueBillPaid {
    return billPaid.toStringAsFixed(2).replaceAll('.', ',');
  }

  get getFormattedValueAmountYouHave {
    return amountYouHave.toStringAsFixed(2).replaceAll('.', ',');
  }
  //#endregion
}