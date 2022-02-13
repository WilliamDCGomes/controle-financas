import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:financas_controle/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../1-base/models/bill.dart';
import '../../controllers/billController.dart';
import '../componentsWidgets/billCardWidget.dart';
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
                            children: [
                              TextWidget(
                                controller.bill.billName ?? "",
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                              TextWidget(
                                "Venc.: ${controller.bill.formatedDate}",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.start,
                                maxLines: 1,
                              ),
                            ],
                          ),

                        ),
                      ],
                    ),
                    floatingActionButton: SizedBox(
                      width: 100.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 4.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: controller.bill.getColor,
                                image: DecorationImage(
                                  image: AssetImage(
                                    controller.bill.getImagebackground,
                                  ),
                                  fit: BoxFit.fill,
                                  opacity: controller.bill.opacityValue,
                                ),
                              ),
                            ),
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

                            ),
                          ],
                        ),
                      ),
                    ),

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
