import 'package:financas_controle/1-base/models/bill.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class BillCardWidget extends StatelessWidget {
  final double? widthButton;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Bill billItem;
  final Function()? onPressed;

  const BillCardWidget(
      { Key? key,
        this.widthButton,
        this.fontWeight,
        this.textColor,
        required this.billItem,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 20.h,
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.5.h),
          color: billItem.getColor,
          image: DecorationImage(
            image: AssetImage(
              billItem.getImagebackground,
            ),
            fit: BoxFit.cover,
            opacity: billItem.opacityValue,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 66.w,
                        child: TextWidget(
                          billItem.title ?? "",
                          maxLines: 1,
                          textColor: AppColors().whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          textAlign: TextAlign.start,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: billItem.isFavorited ?
                        AppColors().redCardColor :
                        AppColors().blackColor91Percent,
                        size: 8.w,
                      ),
                    ],
                  ),
                  TextWidget(
                    "Cód. ${billItem.billCode}",
                    textColor: AppColors().whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    textAlign: TextAlign.start,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 42.w,
                        child: TextWidget(
                          billItem.authorsComment ?? "",
                          maxLines: 1,
                          textColor: AppColors().whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          textAlign: TextAlign.start,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextWidget(
                        "Dificuldade: ${billItem.difficultyLevel}",
                        textColor: AppColors().whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        textAlign: TextAlign.start,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}