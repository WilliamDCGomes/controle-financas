import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class TwoInformationsValueWidget extends StatelessWidget {
  final String titleFirstValue;
  final String firstValue;
  final String titleSecondValue;
  final String secondValue;
  final List<Color> gradientColor;

  const TwoInformationsValueWidget(
      { Key? key,
        required this.titleFirstValue,
        required this.firstValue,
        required this.titleSecondValue,
        required this.secondValue,
        required this.gradientColor,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.5.h),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextWidget(
              titleFirstValue,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              maxLines: 1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Center(
                child: TextWidget(
                  firstValue,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: TextWidget(
                titleSecondValue,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.end,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0.5.h),
              child: Center(
                child: TextWidget(
                  secondValue,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
