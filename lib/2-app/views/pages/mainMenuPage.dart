import 'package:financas_controle/2-app/controllers/mainMenuController.dart';
import 'package:financas_controle/2-app/helpers/phoneTablet.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/billCardWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/menuOptionsWidget.dart';
import 'package:financas_controle/2-app/views/componentsWidgets/textWidget.dart';
import 'package:financas_controle/2-app/views/stylePages/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  _MainMenuPageState createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  late MainMenuController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(MainMenuController());

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
              body: Padding(
                padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 8.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                "Olá, ${controller.nameUser}",
                                textColor: AppColors().whiteColor,
                                fontSize: 17.sp,
                                textAlign: TextAlign.start,
                              ),
                              Obx(() => TextWidget(
                                controller.welcomePhrase.value,
                                textColor: AppColors().whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 21.sp,
                                textAlign: TextAlign.start,
                              ),
                              ),
                            ],
                          ),
                          Container(
                            height: 8.h,
                            width: 8.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.h),
                              color: AppColors().grayColor,
                            ),
                            child: Obx(
                                  () => controller.hasPicture.value ?
                              Image.asset(
                                  ""
                              ) :
                              Center(
                                child: TextWidget(
                                  controller.nameInitials,
                                  textColor: AppColors().standardColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Container(
                        height: 80.h,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5.h),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: AppColors().gradientColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(1.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            "Contas a Pagar: R\$ ${controller.getFormattedValueBillToPay}",
                                            textColor: AppColors().whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextWidget(
                                            "Contas Pagas: R\$ ${controller.getFormattedValueBillPaid}",
                                            textColor: AppColors().whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            "Dinheiro Restante: R\$ ${controller.getFormattedValueAmountYouHave}",
                                            textColor: AppColors().whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp,
                                            textAlign: TextAlign.start,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MenuOptionsWidget(
                                      text: "Contas",
                                      icon: Icon(
                                        Icons.account_balance,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                    MenuOptionsWidget(
                                      text: "Para pagar",
                                      icon: Icon(
                                        Icons.account_balance_wallet,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                    MenuOptionsWidget(
                                      text: "Pagos",
                                      icon: Icon(
                                        Icons.done,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MenuOptionsWidget(
                                      text: "Investimento",
                                      icon: Icon(
                                        Icons.auto_graph,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                    MenuOptionsWidget(
                                      text: "Histórico",
                                      icon: Icon(
                                        Icons.history,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                    MenuOptionsWidget(
                                      text: "Adicionar",
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: AppColors().whiteColor,
                                        size: 6.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: TextWidget(
                                  "Que ainda não foram pagos",
                                  textColor: AppColors().whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: 1,
                                color: AppColors().whiteColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child: SizedBox(
                                  height: PhoneTablet().isPhone(context) ?
                                  20.h : 22.h,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.notPaidYet.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Hero(
                                          tag: controller.notPaidYet[index].id,
                                          child: BillCardWidget(
                                            billItem: controller.notPaidYet[index],
                                            onPressed: () => controller.openBill(controller.notPaidYet[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: TextWidget(
                                  "Os que já foram pagos",
                                  textColor: AppColors().whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: 1,
                                color: AppColors().whiteColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child: SizedBox(
                                  height: PhoneTablet().isPhone(context) ?
                                  20.h : 22.h,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.billsAlreadyPaid.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Hero(
                                          tag: controller.billsAlreadyPaid[index].id,
                                          child: BillCardWidget(
                                            billItem: controller.billsAlreadyPaid[index],
                                            onPressed: () => controller.openBill(controller.billsAlreadyPaid[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: TextWidget(
                                  "Contas fixas",
                                  textColor: AppColors().whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: 1,
                                color: AppColors().whiteColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child: SizedBox(
                                  height: PhoneTablet().isPhone(context) ?
                                  20.h : 22.h,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.fixedBills.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Hero(
                                          tag: controller.fixedBills[index].id,
                                          child: BillCardWidget(
                                            billItem: controller.fixedBills[index],
                                            onPressed: () => controller.openBill(controller.fixedBills[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: TextWidget(
                                  "Contas Periódicas",
                                  textColor: AppColors().whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Container(
                                height: 1,
                                color: AppColors().whiteColor,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1.5.h),
                                child: SizedBox(
                                  height: PhoneTablet().isPhone(context) ?
                                  20.h : 22.h,
                                  width: 100.w,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.periodicExpenses.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.only(right: 2.w),
                                        child: Hero(
                                          tag: controller.periodicExpenses[index].id,
                                          child: BillCardWidget(
                                            billItem: controller.periodicExpenses[index],
                                            onPressed: () => controller.openBill(controller.periodicExpenses[index]),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}