import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../1-base/models/bill.dart';
import '../../enums/enums.dart';
import '../stylePages/appColors.dart';
import 'textWidget.dart';
import 'twoInformationsValueWidget.dart';

class PlotViewCardWidget extends StatelessWidget {
  final Bill bill;
  final String firstTitleValueCard;
  final String firstValueCard;
  final String secondTitleValueCard;
  final String secondValueCard;

  const PlotViewCardWidget(
      { Key? key,
        required this.bill,
        required this.firstTitleValueCard,
        required this.firstValueCard,
        required this.secondTitleValueCard,
        required this.secondValueCard,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Scaffold(
        backgroundColor: AppColors().transparentColor,
        body: Card(
          color: AppColors().standardColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.5.h),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 1.5.w),
                  child: Container(
                    width: 90.w - 4.h,
                    child: TextWidget(
                      bill.billName ?? "",
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: .5.h),
                  child: TextWidget(
                    "Venc.: ${bill.formattedDate}",
                    fontSize: 19.sp,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TwoInformationsValueWidget(
                        titleFirstValue: firstTitleValueCard,
                        firstValue: firstValueCard,
                        titleSecondValue: secondTitleValueCard,
                        secondValue: secondValueCard,
                        gradientColor: bill.getGradient,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: bill.statusBill != StatusBill.alreadyPaid?
        FloatingActionButton.extended(
          onPressed: () {

          },
          label: TextWidget(
              "Pago!"
          ),
          icon: Icon(
              Icons.done_outline_sharp
          ),
          backgroundColor: AppColors().greenColor,
          elevation: 3,
        ) : null,
      ),
    );
  }
}
