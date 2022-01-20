import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:quit_smoking/Dashbord/achievement/all_achievement.dart';
import 'package:quit_smoking/Dashbord/achievement/explore_all_achievements.dart';
import 'package:quit_smoking/qc_getx_controller/achievement_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      // height: 200,
      color: Colors.grey[100],
      child: Column(
        children: [
          'Achievement'.text.makeCentered(),
          AllAchievement(),
          ExploreButton(
            onPressed: () {
              Get.to(ExploreAllAchievements());
            },
          )
        ],
      ),
    );
  }
}
