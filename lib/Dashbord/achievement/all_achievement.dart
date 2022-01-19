import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Dashbord/achievement/achievement_widget.dart';
import 'package:quit_smoking/qc_getx_controller/achievement_controller.dart';
import 'package:quit_smoking/qc_getx_controller/all_info_controller.dart';
import 'package:quit_smoking/qc_getx_controller/smoke_free_time_contreller.dart';

class AllAchievement extends StatelessWidget {
  AllAchievement({Key? key}) : super(key: key);
  final AchievementController _achievementController =
      Get.find<AchievementController>();
  final AllInfoController _allInfoController = Get.find<AllInfoController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(_achievementController.achievement.length,
                  (index) {
            dynamic achievement =
                _achievementController.achievement.value[index];
            int value = 100;
            print("${achievement['valueType']} ${achievement['value']}");

            if (achievement['valueType'] == "minutes") {
              value = _allInfoController.totalMinutes.value;
            } else if (achievement['valueType'] == "hours") {
              value = _allInfoController.totalHours.value;
            } else if (achievement['valueType'] == "days") {
              value = _allInfoController.totalDays.value;
            } else if (achievement['valueType'] == "months") {
              value = _allInfoController.totalMonths.value;
            } else if (achievement['valueType'] == "years") {
              value = _allInfoController.totalYears.value;
            }
            print('value $value');

            /// use total times
            // dynamic valueType = _smokeFreeTimeController
            //     .countdown.value[achievement["valueType"]];
            bool isTrue = value >= achievement['value'];
            print(isTrue);
            return AchievementWidget(
              title: achievement['title'],
              isAchieve: isTrue,
            );
          })),
        ));
  }
}
