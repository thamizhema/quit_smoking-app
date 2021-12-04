import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Missions/mission_widget.dart';
import 'package:quit_smoking/Missions/view_mission.dart';
import 'package:quit_smoking/qc_getx_controller/mission_controller.dart';

class AllMissions extends StatelessWidget {
  AllMissions({Key? key}) : super(key: key);
  final getStorage = GetStorage();
  final MissionController _missionController = Get.find<MissionController>();
  addData() async {
    print(_missionController.allMission.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Obx(
            () => ListView.builder(
                itemCount: _missionController.allMission.length,
                itemBuilder: (context, index) {
                  Map mission = _missionController.allMission.value[index];
                  return MissionWidget(
                    isCompleted: mission['isCompleted'],
                    title: mission['dayOfMission'],
                    onPressed: () {
                      Get.to(
                          ViewMission(
                            index: index,
                            missionInfo: mission,
                          ),
                          transition: Transition.cupertino);
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
