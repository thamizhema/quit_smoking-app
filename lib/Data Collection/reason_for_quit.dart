import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/custom_action_chip.dart';
import 'package:quit_smoking/Data%20Collection/content_title.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class ReasonForQuit extends StatelessWidget {
  ReasonForQuit({Key? key}) : super(key: key);
  final UserInfoController _userInfoController = Get.find<UserInfoController>();

  void selectReason(reason) {
    if (_userInfoController.quitReasons.value.contains(reason)) {
      _userInfoController.removequitReasons(reason);
    } else {
      _userInfoController.setquitReasons(reason);
    }
  }

  List<String> reasons = [
    'Freedom',
    'Money',
    'Health',
    'Children',
    'Accountability',
    'Stink',
    'Fitness',
    'Pregnant',
    'Environment',
    'Childbearing',
    'Appearance',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContentTitle(
            title: 'Reason for Quit?',
            subtitle: 'Choose your personal motives here',
          ),
          const SizedBox(
            height: 25,
          ),
          Obx(
            () => Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: -3,
                children: List.generate(
                  reasons.length,
                  (index) => CustomActionChip(
                    value: reasons[index],
                    isSelected: _userInfoController.quitReasons.value
                        .contains(reasons[index]),
                    onPressed: () {
                      selectReason(reasons[index]);
                    },
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
