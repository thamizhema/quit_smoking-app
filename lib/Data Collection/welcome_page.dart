import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  UserInfoController _userInfoController = Get.find<UserInfoController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RichText(
          text: TextSpan(
              text: "Hi ",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              children: [
                TextSpan(
                    text: _userInfoController.userInfo.value['username']
                        .toString(),
                    style: TextStyle(
                      color: OurColors.mainColor,
                      fontWeight: FontWeight.bold,
                    )),
                const TextSpan(text: " Welcome to Smoke free life"),
              ]),
        ),
      ),
    );
  }
}
