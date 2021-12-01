import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:quit_smoking/Dashbord/money_saved/total_money_saved.dart';
import 'package:quit_smoking/qc_getx_controller/money_saved_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class MoneySaved extends StatelessWidget {
  MoneySaved({Key? key}) : super(key: key);

  final MoneySavedController _savedController =
      Get.find<MoneySavedController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: const Color(0xffF6F6F6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: context.screenWidth / 2.4,
                  child: buildAmount(
                      amountTitle: 'Money Saved',
                      amount: _savedController.moneySaved.value.numCurrency),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  width: 2,
                  color: Colors.grey[400],
                ),
                Container(
                  width: context.screenWidth / 2.4,
                  child: buildAmount(
                      amountTitle: 'Per Year',
                      amount: _savedController
                          .perYearOfMoneySaved.value.numCurrency),
                ),
              ],
            ),
          ),
          // Obx(() => Text('ff')),
          ExploreButton(
            onPressed: () {
              Get.to(TotalMoneySaved(), transition: Transition.cupertino);
            },
          ),
        ],
      ),
    );
  }

  Widget buildAmount({amountTitle, amount}) {
    return Column(
      children: [
        '$amountTitle'.text.make(),
        '₹$amount'.text.xl3.color(OurColors.mainColor).make(),
      ],
    );
  }
}
