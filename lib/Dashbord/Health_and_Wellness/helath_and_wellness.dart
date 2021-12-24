import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/all_health_and_wellness.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/health_and_wellness_navigation.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthAndWellness extends StatelessWidget {
  HealthAndWellness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: context.screenWidth,
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(items.length, (index) {
                return items[index];
              }),
            ),
          ),
          ExploreButton(
            onPressed: () {
              Get.to(AllHealthAndWellness());
            },
          )
        ],
      ),
    );
  }
}
