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
                  padding: EdgeInsets.only(top: 18.h),
                  child: Scaffold(
                    backgroundColor: AppColors().transparentColor,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.5.w, right: 1.5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget(
                                controller.bill.billName ?? "",
                                fontSize: 21.sp,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                              TextWidget(
                                "Venc.: ${controller.bill.formattedDate}",
                                fontSize: 19.sp,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TwoInformationsValueWidget(
                                titleFirstValue: controller.firstTitleValueCard,
                                firstValue: controller.firstValueCard,
                                titleSecondValue: controller.secondTitleValueCard,
                                secondValue: controller.secondValueCard,
                              )

                            ],
                          ),
                        ),
                      ],
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
