import 'package:financas_controle/2-app/enums/enums.dart';
import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:uuid/uuid.dart';

class Bill {
  //#region Attributes
  late String id;
  String? billName;
  late bool fixedBill;
  bool? isInvestment;
  bool? isAFutureBill;
  int? billCode;
  int? plots;
  int? formPayment;
  double? billValue;
  double? muchPaid;
  double? amountWantAchieve;
  double? amountAlreadyHave;
  DateTime? billDate;
  DateTime? whenPaid;
  StatusBill? statusBill;
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

  get getImagebackground {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return "${Paths().imagesPath}postBeginnerLevel.png";
      case StatusBill.late:
        return "${Paths().imagesPath}intermediateLevel.png";
      case StatusBill.investment:
        return "${Paths().imagesPath}postIntermediateLevel.png";
      case StatusBill.futureBill:
        return "${Paths().imagesPath}hardLevel.png";
      default:
        return "${Paths().imagesPath}beginnerLevel.png";
    }
  }

  get opacityValue {
    switch (statusBill) {
      case StatusBill.deadlineEnding:
        return 0.5;
      case StatusBill.late:
        return 0.4;
      case StatusBill.investment:
        return 0.4;
      case StatusBill.futureBill:
        return 0.4;
      default:
        return 0.3;
    }
  }

  get getStarColor {
    if (fixedBill)
      return AppColors().redCardColor;
    return AppColors().whiteColor;
  }
  //#endregion
}