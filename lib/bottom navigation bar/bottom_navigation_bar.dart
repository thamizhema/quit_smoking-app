import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Cravings/cravings.dart';
import 'package:quit_smoking/Dashbord/dashboard.dart';
import 'package:quit_smoking/Journal/journal.dart';
import 'package:quit_smoking/Missions/all_mission.dart';

import 'package:quit_smoking/qc_getx_controller/bottom_navigation_bar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);
  final BottomNavigationBarController _navigationBarController =
      Get.find<BottomNavigationBarController>();
  List<Widget> tabs = [
    Dashboard(),
    AllMissions(),
    Journal(),
    Cravings(),
    Center(child: Text('Support')),
  ];
  List<IconData> icons = [
    Icons.menu,
    Icons.offline_pin_outlined,
    Icons.paste,
    Icons.query_stats,
    Icons.person_outline_sharp,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: OurColors.mainColor,
        child: Obx(
          () => CurvedNavigationBar(
            height: 50,
            animationDuration: const Duration(milliseconds: 100),
            animationCurve: Curves.easeIn,
            backgroundColor: Colors.white,
            buttonBackgroundColor: OurColors.mainColor,
            color: OurColors.mainColor,
            items: List.generate(
              icons.length,
              (index) => Icon(
                icons[index],
                size: 25,
                color: index == _navigationBarController.pageIndex.value
                    ? Colors.white
                    : const Color(0xff022B0D),
              ),
            ).toList(),
            onTap: (value) {
              print(value);
              _navigationBarController.setPageIndex(value);
            },
          ),
        ),
      ),
      body: Obx(() => tabs[_navigationBarController.pageIndex.value]),
    );
  }
}
