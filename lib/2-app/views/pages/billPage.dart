import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            child: Scaffold(
              backgroundColor: AppColors().transparentColor,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: controller.bill.id,
                    child: BillCardWidget(
                      billItem: controller.bill,
                      borderRadius: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
