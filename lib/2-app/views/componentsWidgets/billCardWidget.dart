import 'package:financas_controle/1-base/models/bill.dart';
import 'package:financas_controle/2-app/helpers/dateFormatToBrazil.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textWidget.dart';

class BillCardWidget extends StatelessWidget {
  final String? eraseFilds;
  final double? width;
  final double? widthButton;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Bill billItem;
  final Function()? onPressed;

  const BillCardWidget(
      { Key? key,
        this.eraseFilds,
        this.width,
        this.widthButton,
        this.borderRadius,
        this.fontWeight,
        this.textColor,
        required this.billItem,
        this.onPressed,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        color: AppColors().transparentColor,
        child: Container(
          height: 20.h,
          width: width ?? 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 2.5.h),
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
                            eraseFilds ?? "Cód. ${billItem.billCode}",
                            textColor: AppColors().whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: billItem.fixedBill ?
                          AppColors().yellowColor :
                          AppColors().blackColor91Percent,
                          size: 8.w,
                        ),
                      ],
                    ),
                    TextWidget(
                      eraseFilds ?? (billItem.billName ?? ""),
                      maxLines: 1,
                      textColor: AppColors().whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          eraseFilds ?? "Venc.: ${DateFormatToBrazil().formatDate(billItem.billDate)}",
                          maxLines: 1,
                          textColor: AppColors().whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          width: 1.5.w,
                        ),
                        TextWidget(
                          eraseFilds ?? "Valor: R\$ ${billItem.getFormattedValue}",
                          maxLines: 1,
                          textColor: AppColors().whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}