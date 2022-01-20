import 'package:flutter/material.dart';
import '2-app/enums/enums.dart';
import 'app.dart';
import 'flavors.dart';

buildFlavor(Flavor flavor) {
  F.appFlavor = flavor;
  runApp(App());
}