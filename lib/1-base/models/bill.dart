import 'package:financas_controle/2-app/enums/enums.dart';
import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:uuid/uuid.dart';
import '../../2-app/helpers/dateFormatToBrazil.dart';

class Bill {
  //#region Attributes
  late String id;
  String? billName;
  String? otherPaymentForm;
  late bool fixedBill;
  bool? isAFutureBill;
  int? billCode;
  int? plots;
  int? plotsPaid;
  double? billValue;
  double? muchPaid;
  double? amountWantAchieve;
  double? amountAlreadyHave;
  DateTime? billDate;
  DateTime? whenPaid;
  StatusBill? statusBill;
  FormPayment? formPayment;
  //#endregion

  //#region Constructor
  Bill() {
    id = Uuid().v4();
    fixedBill = false;
  }
  //#endregion

  //#region Encapsulation
  get getColor {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return AppColors().orangeCardColor;
      case StatusBill.late:
        return AppColors().redCardColor;
      case StatusBill.investment:
        return AppColors().blueCardColor;
      case StatusBill.futureBill:
        return AppColors().purpleCardColor;
      default:
        return AppColors().greenCardColor;
    }
  }

  get getStatusBarColor {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return AppColors().orangeColorStatusBar;
      case StatusBill.late:
        return AppColors().redColorStatusBar;
      case StatusBill.investment:
        return AppColors().blueColorStatusBar;
      case StatusBill.futureBill:
        return AppColors().purpleColorStatusBar;
      default:
        return AppColors().greenColorStatusBar;
    }
  }

  get getAccountType {
    if(fixedBill)
      return "Conta Fixa";
    return "Conta Periódica";
  }

  get getImagebackground {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return "${Paths().imagesPath}fiveDaysToPay.jpg";
      case StatusBill.late:
        return "${Paths().imagesPath}late.jpg";
      case StatusBill.investment:
        return "${Paths().imagesPath}investment.jpg";
      case StatusBill.futureBill:
        return "${Paths().imagesPath}futureBill.jpg";
      default:
        return "${Paths().imagesPath}billPaid.jpg";
    }
  }

  get getStatusBillName {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return "Vencimento Próximo";
      case StatusBill.late:
        return "Atrasada";
      case StatusBill.investment:
        return "Investimento";
      case StatusBill.futureBill:
        return "Conta Futura";
      default:
        return "Conta Paga";
    }
  }

  get getGradient {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return AppColors().deadlineEndingGradientColor;
      case StatusBill.late:
        return AppColors().lateGradientColor;
      case StatusBill.investment:
        return AppColors().investmentGradientColor;
      case StatusBill.futureBill:
        return AppColors().futureBillGradientColor;
      default:
        return AppColors().alreadyPaidGradientColor;
    }
  }

  get getFormPayment {
    switch (formPayment) {
      case FormPayment.check:
        return "Cheque";
      case FormPayment.creditCard:
        return "Cartão de Crédito";
      case FormPayment.debtCard:
        return "Cartão de Débito";
      case FormPayment.bankTransfer:
        return "Transferência Bancária";
      case FormPayment.bankSlip:
        return "Boleto Bancário";
      case FormPayment.other:
        return otherPaymentForm;
      default:
        return "Dinheiro";
    }
  }

  get opacityValue {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return 0.6;
      case StatusBill.late:
        return 0.5;
      case StatusBill.investment:
        return 0.5;
      case StatusBill.futureBill:
        return 0.5;
      default:
        return 0.4;
    }
  }

  get getStarColor {
    if (fixedBill)
      return AppColors().redCardColor;
    return AppColors().whiteColor;
  }

  get formattedDate {
    return DateFormatToBrazil().formatDate(billDate);
  }

  get formattedWhenPaid {
    return DateFormatToBrazil().formatDate(whenPaid);
  }

  get formattedDateInformation {
    return DateFormatToBrazil().mounthAndYear(billDate);
  }

  get getFormattedValue {
    if(billValue != null)
      return billValue!.toStringAsFixed(2).replaceAll('.', ',');
    return "0,00";
  }

  get getFormattedValuePaid {
    if(muchPaid != null)
      return muchPaid!.toStringAsFixed(2).replaceAll('.', ',');
    return "0,00";
  }

  get getFormattedValueWantAchieve {
    if(amountWantAchieve != null)
      return amountWantAchieve!.toStringAsFixed(2).replaceAll('.', ',');
    return "0,00";
  }

  get getFormattedValueAlreadyHave {
    if(amountAlreadyHave != null)
      return amountAlreadyHave!.toStringAsFixed(2).replaceAll('.', ',');
    return "0,00";
  }

  get plotsRemaining {
    if(plots != null && plotsPaid != null) {
      int remainig = plots! - plotsPaid!;
      if(remainig > 1)
        return "${remainig} parcelas restantes";
      return "1 parcela restante";
    }
    return "0";
  }
  //#endregion
}