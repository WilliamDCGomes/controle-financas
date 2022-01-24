import 'package:flutter/material.dart';
import '2-app/enums/enums.dart';
import '2-app/views/pages/initialPage.dart';

class F {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.HMLG:
        return 'Controle Financeiro HMLG';
      case Flavor.PROD:
        return 'Controle Financeiro';
      default:
        return 'Controle Financeiro DEV';
    }
  }

  static bool get isDev => F.appFlavor == Flavor.DEV;
  static bool get isHmlg => F.appFlavor == Flavor.HMLG;
  static bool get isProd => F.appFlavor == Flavor.PROD;

  static String get baseURL {
    switch (appFlavor) {
      case Flavor.HMLG:
        return '';
      case Flavor.PROD:
        return '';
      default:
        return '';
    }
  }

  static Widget get initialScreen {
    switch (appFlavor) {
      case Flavor.HMLG:
        return InitialPage();
      case Flavor.PROD:
        return InitialPage();
      default:
        return InitialPage();
    }
  }
}
