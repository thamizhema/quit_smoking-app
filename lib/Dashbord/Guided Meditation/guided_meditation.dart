import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Dashbord/Guided%20Meditation/see_all_meditation.dart';
import 'package:velocity_x/velocity_x.dart';

class GuidedMeditation extends StatelessWidget {
  const GuidedMeditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: context.screenWidth,
            height: 180,
            child: Image.asset(
              'images/learn-to-meditate.png',
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
            ),
          ),
          'Guided Meditation'
              .text
              .gray500
              .size(16)
              .bold
              .make()
              .positioned(left: 8)
        ],
      ),
    ).onInkTap(() {
      Get.to(SeeAllMeditation(), transition: Transition.cupertino);
    });
  }
}
