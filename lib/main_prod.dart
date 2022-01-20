import 'package:flutter/material.dart';
import '2-app/enums/enums.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PROD;
  runApp(App());
}