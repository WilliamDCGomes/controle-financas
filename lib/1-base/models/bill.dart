import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:uuid/uuid.dart';

class Bill {
  //#region Attributes
  late String id;
  int? billCode;
  int? difficultyLevel;
  String? title;
  String? siteOrigem;
  String? necessaryKnowledge;
  String? description;
  String? authorsComment;
  late bool isFavorited;
  //#endregion

  //#region Constructor
  Bill() {
    id = Uuid().v4();
    isFavorited = false;
  }
  //#endregion

  //#region Encapsulation
  get getColor {
    switch (difficultyLevel) {
      case 2:
        return AppColors().blueCardColor;
      case 3:
        return AppColors().purpleCardColor;
      case 4:
        return AppColors().orangeCardColor;
      case 5:
        return AppColors().redCardColor;
      default:
        return AppColors().greenCardColor;
    }
  }

  get getImagebackground {
    switch (difficultyLevel) {
      case 2:
        return "${Paths().imagesPath}postBeginnerLevel.png";
      case 3:
        return "${Paths().imagesPath}intermediateLevel.png";
      case 4:
        return "${Paths().imagesPath}postIntermediateLevel.png";
      case 5:
        return "${Paths().imagesPath}hardLevel.png";
      default:
        return "${Paths().imagesPath}beginnerLevel.png";
    }
  }

  get opacityValue {
    switch (difficultyLevel) {
      case 2:
        return 0.5;
      case 3:
        return 0.4;
      case 4:
        return 0.6;
      case 5:
        return 0.6;
      default:
        return 0.3;
    }
  }

  get getStarColor {
    if (isFavorited)
      return AppColors().redCardColor;
    return AppColors().whiteColor;
  }
  //#endregion
}