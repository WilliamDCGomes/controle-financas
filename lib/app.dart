import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0XFF0A0F37),
      systemNavigationBarColor: Color(0XFF0A0F35),
    ));

    return ResponsiveSizer(builder: (context, orientation, screentype) {
      return GetMaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: [
          GetPage(name: "/initialPage", page: () => F.initialScreen),
        ],
        initialRoute: "/initialPage",
      );
    });
  }
}