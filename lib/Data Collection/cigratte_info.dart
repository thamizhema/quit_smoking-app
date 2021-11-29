import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Data%20Collection/about_cigarettes.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

class CigaretteInfo extends StatelessWidget {
  CigaretteInfo({Key? key}) : super(key: key);
  final UserInfoController _userInfoController = Get.find<UserInfoController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutCigarettes(
            question: 'How Many Cigarettes Did You Smoke a Day?',
            onChange: (value) {
              _userInfoController.updateUserInfo({"dayOfCigarette": value});
            },
          ),
          AboutCigarettes(
            initialValue: 10,
            question: 'How Many Cigarettes Are In Your Pack?',
            onChange: (value) {
              _userInfoController.updateUserInfo({"packOfCigarettes": value});
            },
          ),
          AboutCigarettes(
            initialValue: 100,
            question: 'How Much Dose Your Box Of Cigarettes Cost?',
            onChange: (value) {
              _userInfoController.updateUserInfo({"priceOfPack": value});
            },
          ),
          AboutCigarettes(
            question: 'How Many Years Have You Been Smoking?',
            onChange: (value) {
              _userInfoController.updateUserInfo({"addictionOfYears": value});
            },
          ),
        ],
      ),
    );
  }
}
