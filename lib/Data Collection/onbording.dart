import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Data%20Collection/cigratte_info.dart';
import 'package:quit_smoking/Data%20Collection/reason_for_quit.dart';
import 'package:quit_smoking/Data%20Collection/syncfution_datetime_picker.dart';
import 'package:quit_smoking/Data%20Collection/welcome_page.dart';
import 'package:quit_smoking/login.dart';
import 'package:quit_smoking/login/sign_up.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class OnBording extends StatefulWidget {
  OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  final userData = GetStorage();

  final UserInfoController _userInfoController = Get.find<UserInfoController>();

  List<Widget> dataCollection = [
    WelcomePage(),
    SyncfutionDatePicker(),
    CigaretteInfo(),
    ReasonForQuit(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _userInfoController.pageController.value,
              onPageChanged: (val) {
                setState(() {
                  _userInfoController.setPageIndex(val);
                });
              },
              itemCount: dataCollection.length,
              itemBuilder: (context, index) {
                return dataCollection[index];
              },
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: context.screenWidth,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          dataCollection.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                color:
                                    _userInfoController.pageIndex.value == index
                                        ? OurColors.mainColor
                                        : Colors.grey,
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                print(_userInfoController.ourUser.value);
                              },
                              child: Text('userInfo')),
                          TextButton(
                              onPressed: () {
                                userData.remove('isLogged');
                                userData.remove('userInfo');
                              },
                              child: Text('Log out')),
                          Text(_userInfoController.pageIndex.value + 1 ==
                                      dataCollection.length
                                  ? "Finish"
                                  : "Next")
                              .text
                              .color(OurColors.mainColor)
                              .makeCentered()
                              .box
                              .p8
                              .makeCentered()
                              .onInkTap(() {
                            if (_userInfoController.pageIndex.value + 1 ==
                                dataCollection.length) {
                              _userInfoController.updateUserInfo({
                                'quitReason':
                                    _userInfoController.quitReason.value
                              });
                              _userInfoController.addUserInfoToDb();
                            } else {
                              _userInfoController.pageController.value.nextPage(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.ease);
                            }
                          }),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
// TextButton(
// onPressed: () {
// userData.write('isLogged', false);
// Get.to(SignUp());
// },
// child: Text('Logout'))
