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

  List tempList = [
    {
      "title": "10 Minutes smoke free",
      "isCompleted": false,
      "valueType": "minutes",
      "value": 10,
      "id": 1
    },
    {
      "title": "60 Minutes smoke free",
      "isCompleted": false,
      "valueType": "minutes",
      "value": 60,
      "id": 2
    },
    {
      "title": "5 Hours smoke free",
      "isCompleted": false,
      "valueType": "hours",
      "value": 5,
      "id": 3
    },
    {
      "title": "400 Day smoke free",
      "isCompleted": false,
      "valueType": "days",
      "value": 400,
      "id": 4
    },
    {
      "title": "14 months smoke free",
      "isCompleted": false,
      "valueType": "months",
      "value": 14,
      "id": 5
    },
    {
      "title": "2 year smoke free",
      "isCompleted": false,
      "valueType": "years",
      "value": 2,
      "id": 6
    }
  ];
  List<Widget> test() {
    List<Widget> Achieve = [];
    // for (final achievement in _achievementController.achievement.value) {
    for (final achievement in tempList) {
      int value = 100;
      // print("${achievement['valueType']} ${achievement['value']}");

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

      // print('value $value');
      bool isTrue = value >= achievement['value'];
      if (Achieve.length >= 3) {
        break;
      }
      print(isTrue);
      if (!isTrue) {
        Achieve.add(AchievementWidget(
          title: achievement['title'],
          isAchieve: isTrue,
        ));
      }
    }
    return Achieve;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: test(),
        ),
      ),
    );
  }
}
