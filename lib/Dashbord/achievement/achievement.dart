import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:quit_smoking/Dashbord/achievement/all_achievement.dart';
import 'package:quit_smoking/qc_getx_controller/achievement_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Achievement extends StatefulWidget {
  const Achievement({Key? key}) : super(key: key);

  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  final AchievementController _achievementController =
      Get.find<AchievementController>();

  // getData() async {
  //   var url = Uri.parse('http://192.168.0.40:4000/achievement');
  //   final res = await http.get(url);
  //   print(res.body.runtimeType);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      color: Colors.grey[200],
      child: Column(
        children: [
          'Achievement'.text.makeCentered(),
          AllAchievement(),
          ExploreButton(
            onPressed: () {
              _achievementController.getAchievementData();
              print('achievement clicked');
            },
          )
        ],
      ),
    );
  }
}
