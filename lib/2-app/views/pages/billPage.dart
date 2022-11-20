import 'package:carousel_slider/carousel_slider.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../1-base/models/bill.dart';
import '../../controllers/billController.dart';
import '../componentsWidgets/billCardWidget.dart';
import '../componentsWidgets/plotViewCardWidget.dart';
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
                CarouselSlider.builder(
                  carouselController: controller.carouselController,
                  itemCount: controller.bill.plots ?? 1,
                  options: CarouselOptions(
                    height: 100.h,
                    viewportFraction: 0.9,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                  ),
                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                    return PlotViewCardWidget(
                      bill: controller.bill,
                      firstTitleValueCard: controller.firstTitleValueCard,
                      firstValueCard: controller.firstValueCard,
                      secondTitleValueCard: controller.secondTitleValueCard,
                      secondValueCard: controller.secondValueCard,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: controller.hasPlots,
                        child: GestureDetector(
                          onTap: () async => await controller.previewsBill(),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors().whiteColor,
                            size: 3.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: TextWidget(
                          controller.bill.formattedDateInformation,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                        ),
                      ),
                      Visibility(
                        visible: controller.hasPlots,
                        child: GestureDetector(
                          onTap: () async => await controller.nextBill(),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: AppColors().whiteColor,
                            size: 3.h,
                          ),
                        ),
                      ),
                    ],
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
