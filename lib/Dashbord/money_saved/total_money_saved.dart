import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/qc_getx_controller/money_saved_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalMoneySaved extends StatelessWidget {
  TotalMoneySaved({Key? key}) : super(key: key);
  final MoneySavedController _savedController =
      Get.find<MoneySavedController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: context.screenHeight / 2,
                  child: Image.asset(
                    'images/pig_bank.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Obx(
                        () => buildAmount(
                            amountTitle: 'Money Saved',
                            amount:
                                _savedController.moneySaved.value.numCurrency),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      buildAmount(
                          amountTitle: 'Per Day',
                          amount: _savedController
                              .perDayOfMoneySaved.value.numCurrency),
                      buildAmount(
                          amountTitle: 'Per Month',
                          amount: _savedController
                              .perMonthOfMoneySaved.value.numCurrency),
                      buildAmount(
                          amountTitle: 'Per Year',
                          amount: _savedController
                              .perYearOfMoneySaved.value.numCurrency),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  color: Colors.grey,
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildAmount({amountTitle, amount}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '$amountTitle'.text.xl2.gray400.make(),
          '₹$amount'.text.xl2.color(OurColors.mainColor).make(),
        ],
      ),
    );
  }
}
