import 'package:financas_controle/2-app/enums/enums.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../1-base/models/bill.dart';
import '../../controllers/billController.dart';
import '../componentsWidgets/billCardWidget.dart';
import '../componentsWidgets/twoInformationsValueWidget.dart';
import '../stylePages/appColors.dart';

class BillPage extends StatefulWidget {
  final Bill bill;
  const BillPage(this.bill, {Key? key}) : super(key: key);

  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  late BillController controller;

  @override
  void dispose() {
    controller.getStatusBarColorClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller = Get.put(BillController(widget.bill));

    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            color: AppColors().standardColor,
            child: Stack(
              children: [
                Hero(
                  tag: controller.bill.id,
                  child: BillCardWidget(
                    eraseFilds: "",
                    billItem: controller.bill,
                    borderRadius: 0,
                    width: 100.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h),
                  child: Scaffold(
                    backgroundColor: AppColors().transparentColor,
                    body: Padding(
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      child: Card(
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
                                    controller.bill.billName ?? "",
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
                                  "Venc.: ${controller.bill.formattedDate}",
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
                                      titleFirstValue: controller.firstTitleValueCard,
                                      firstValue: controller.firstValueCard,
                                      titleSecondValue: controller.secondTitleValueCard,
                                      secondValue: controller.secondValueCard,
                                      gradientColor: controller.bill.getGradient,
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    floatingActionButton: controller.bill.statusBill != StatusBill.alreadyPaid?
                      FloatingActionButton.extended(
                        onPressed: () {

                        },
                        label: TextWidget(
                            "Marcar como pago!"
                        ),
                        icon: Icon(
                            Icons.done_outline_sharp
                        ),
                        backgroundColor: AppColors().greenColor,
                        elevation: 3,
                      ) : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
