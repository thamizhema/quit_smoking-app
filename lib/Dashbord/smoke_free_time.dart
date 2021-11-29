import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SmokeFreeTime extends StatelessWidget {
  SmokeFreeTime({Key? key}) : super(key: key);
  final UserInfoController _userInfoController = Get.find<UserInfoController>();
  final userData = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _userInfoController.userInfo.value.toString().text.makeCentered(),
            TextButton(
                onPressed: () async {
                  userData.write('isLogged', false);
                  // userData.remove('userInfo');
                },
                child: Text('Log out')),
          ],
        ),
      ),
    );
  }
}
