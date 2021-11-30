import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/qc_getx_controller/smoke_free_time_contreller.dart';
import 'package:velocity_x/velocity_x.dart';

class SmokeFreeFullTime extends StatelessWidget {
  SmokeFreeFullTime({Key? key}) : super(key: key);
  final SmokeFreeTimeController _smokeFreeTimeController =
      Get.find<SmokeFreeTimeController>();
  get timing {
    return _smokeFreeTimeController.countdown.value;
  }

  Widget buildTimeWithText({timingName, timing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          timing
              .toString()
              .padLeft(2, '0')
              .text
              .bold
              .white
              .lineHeight(0.5)
              .size(35)
              .make()
              .box
              .width(50)
              .make(),
          timingName.toString().text.xl.white.capitalize.make(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: context.screenHeight,
              child: Image.asset(
                'images/timer_bg.jpg',
                fit: BoxFit.cover,
                alignment: Alignment.bottomLeft,
              ),
            ),
            Container(
              color: Colors.green.withOpacity(0.5),
              // color: Colors.black38,
            ),
            Positioned(
              right: 0,
              child: Container(
                height: context.screenWidth,
                width: context.screenWidth / 2.1,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _smokeFreeTimeController.countdown.value.entries
                        .map((e) => buildTimeWithText(
                            timingName: e.key, timing: e.value))
                        .toList(),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  color: Colors.white,
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
}
