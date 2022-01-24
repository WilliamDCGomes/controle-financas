import 'package:financas_controle/2-app/helpers/paths.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomePageBackgroundWidget extends StatelessWidget {
  const WelcomePageBackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "${Paths().imagesPath}backgroundWelcomePage.png",
          fit: BoxFit.fitHeight,
          height: 100.h,
          width: 100.w,
          cacheHeight: 700,
          cacheWidth: 700,
        ),
        Container(
          height: 100.h,
          width: 100.w,
          color: Color.fromRGBO(0, 0, 0, 0.4),
        ),
      ],
    );
  }
}