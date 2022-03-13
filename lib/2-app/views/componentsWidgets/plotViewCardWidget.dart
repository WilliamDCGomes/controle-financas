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
            child: SizedBox(
              height: 85.h,
              child: SingleChildScrollView(
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
                          textAlign: TextAlign.center,
                          maxLines: 1,
                        ),
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
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextWidget(
                            "Código da Conta:",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                          TextWidget(
                            "${bill.billCode}",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextWidget(
                            "Vencimento:",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                          TextWidget(
                            "${bill.formattedDate}",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextWidget(
                            "Status Atual:",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                          TextWidget(
                            "${bill.getStatusBillName}",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextWidget(
                            "Tipo de Conta:",
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                          TextWidget(
                            "${bill.getAccountType} ",
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: bill.statusBill == StatusBill.alreadyPaid,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextWidget(
                              "Dia do Pagamento:",
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                            TextWidget(
                              "${bill.formattedWhenPaid}",
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: bill.statusBill == StatusBill.alreadyPaid,
                      child: Padding(
                        padding: EdgeInsets.only(top: 3.h, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextWidget(
                              "Forma de Pagamento:",
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                            ),
                            TextWidget(
                              "${bill.getFormPayment}",
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: bill.statusBill != StatusBill.alreadyPaid ?
        FloatingActionButton.extended(
          onPressed: () {

          },
          label: TextWidget(
            "Pagar!",
            fontWeight: FontWeight.bold,
          ),
          icon: Icon(
            Icons.monetization_on,
            color: AppColors().whiteColor,
          ),
          backgroundColor: AppColors().greenCardColor,
          elevation: 3,
        ) : Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.5.h),
            color: AppColors().greenColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 1.h),
                  child: Icon(
                    Icons.done_outline_sharp,
                    color: AppColors().whiteColor,
                  ),
                ),
                TextWidget(
                  "Pago!",
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
