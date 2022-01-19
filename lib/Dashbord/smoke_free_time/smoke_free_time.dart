import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time/smoke_free_full_time.dart';
import 'package:quit_smoking/qc_getx_controller/smoke_free_time_contreller.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SmokeFreeTime extends StatelessWidget {
  SmokeFreeTime({Key? key}) : super(key: key);
  final SmokeFreeTimeController _smokeFreeTimeController =
      Get.find<SmokeFreeTimeController>();
  Map testing = {
    'years': 0,
    'months': 0,
    'days': 29,
    'hours': 0,
    'minutes': 3,
    'seconds': 41
  };
  get timing {
    return _smokeFreeTimeController.countdown.value;
  }

  String imageBg = 'images/timer_bg.jpg';
  final userData = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  dynamic displayTime(BuildContext context) {
    return Visibility(
      visible: timing['seconds'] != null,
      child: Container(
        width: context.screenWidth,
        color: Colors.black45,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (timing['years'] >= 1) buildTimeWithText('years'),
            if (timing['years'] >= 1 || timing['months'] >= 1)
              buildTimeWithText('months'),
            if (timing['days'] >= 1 || timing['months'] >= 1)
              buildTimeWithText('days'),
            if (timing['years'] <= 0) buildTimeWithText('hours'),
            if (timing['months'] <= 0 && timing['years'] <= 0)
              buildTimeWithText('minutes'),
            if (timing['days'] <= 0 &&
                timing['months'] <= 0 &&
                timing['years'] <= 0)
              buildTimeWithText('seconds'),
          ],
        ),
      ).onInkTap(() {
        Get.to(SmokeFreeFullTime(), transition: Transition.rightToLeft);
      }),
    );
  }

  Widget buildTimeWithText(String timerName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          timing[timerName]
              .toString()
              .padLeft(2, '0')
              .text
              .bold
              .white
              .lineHeight(1)
              .size(25)
              .make(),
          timerName.text.white.size(10).capitalize.make(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("smoke_free_time.dart ====== $timing");

    return Container(
      height: 200,
      color: Vx.green300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            imageBg,
            width: context.screenWidth,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 20,
            child: Obx(
              () => displayTime(context),
            ),
          ),
        ],
      ),
    );
  }
}
