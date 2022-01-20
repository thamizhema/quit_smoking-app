import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/qc_getx_controller/achievement_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class AchievementWidget extends StatelessWidget {
  AchievementWidget({
    Key? key,
    this.title = "Achievement title",
    this.isAchieve = false,
  }) : super(key: key);
  bool isAchieve = true;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // color: Colors.lightGreen,
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white, isAchieve ? BlendMode.darken : BlendMode.hue),
              child: Image.asset(
                'images/achivement.png',
                width: 70,
              ),
            ),
          ),
          title.text.align(TextAlign.center).makeCentered()
        ],
      ),
    );
  }
}

class SeeAllAchievements extends StatelessWidget {
  SeeAllAchievements({
    Key? key,
    this.title = "Achievement title",
    this.isAchieve = false,
  }) : super(key: key);
  bool isAchieve = true;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: context.screenWidth / 1.2,
      width: context.screenWidth / 2,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title.text
              .align(TextAlign.center)
              .makeCentered()
              .marginSymmetric(vertical: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.white, isAchieve ? BlendMode.darken : BlendMode.hue),
              child: Image.asset(
                'images/achivement.png',
                width: 100,
              ),
            ),
          ),
          'About achievement'
              .text
              .align(TextAlign.center)
              .makeCentered()
              .marginSymmetric(vertical: 15),
        ],
      ),
    );
  }
}
