import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/textfield.dart';
import 'package:quit_smoking/qc_getx_controller/mission_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class ViewMission extends StatelessWidget {
  ViewMission({Key? key, this.missionInfo, this.index}) : super(key: key);
  Map? missionInfo;
  int? index;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final MissionController _missionController = Get.find<MissionController>();
  final TextEditingController _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Mission Today'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // 'Your Mission Today'.toString().text.xl4.make(),

            Positioned(
              top: 50,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    missionInfo!['yourMission'].toString().text.make(),
                    missionInfo!['whyDoThis'].toString().text.make(),
                    VStack([
                      'Your Notes:'.toString().text.underline.green600.make(),
                      missionInfo!['notes'].toString().text.green600.make(),
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: context.screenWidth,
                    child: CustomTextField(
                      controller: _notes,
                      hintText: "Add some notes",
                      hasIcon: false,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: context.screenWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Material(
                        color: OurColors.mainColor,
                        child: 'Tap When You Have Completed'
                            .text
                            .white
                            .makeCentered()
                            .box
                            .height(50)
                            .makeCentered()
                            .onInkTap(() async {
                          _missionController.updateMission(
                              index: index,
                              isCompleted: true,
                              notes: _notes.text);
                          Get.back();
                        }),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
