import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/colors.dart';

import 'package:quit_smoking/bottom%20navigation%20bar/bottom_navigation_bar.dart';

import 'package:quit_smoking/qc_getx_controller/all_info_controller.dart';
import 'package:quit_smoking/qc_getx_controller/bottom_navigation_bar_controller.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';
import 'package:quit_smoking/qc_getx_controller/health_and_wellness_contreller.dart';
import 'package:quit_smoking/qc_getx_controller/health_improvement_controller.dart';
import 'package:quit_smoking/qc_getx_controller/journal_controller.dart';
import 'package:quit_smoking/qc_getx_controller/mission_controller.dart';
import 'package:quit_smoking/qc_getx_controller/money_saved_controller.dart';
import 'package:quit_smoking/qc_getx_controller/smoke_free_time_contreller.dart';
import 'package:quit_smoking/Data%20Collection/onbording.dart';

import 'package:quit_smoking/login/sign_up.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(MissionController());
  Get.put(UserInfoController());
  Get.put(BottomNavigationBarController());
  Get.put(JournalController());
  Get.put(CravingsController());
  Get.put(HealthAndWellnessController());

  Get.lazyPut(() => SmokeFreeTimeController());
  Get.lazyPut(() => AllInfoController());
  Get.lazyPut(() => MoneySavedController());
  Get.lazyPut(() => HealthImprovementController());
  // Get.lazyPut(() => CravingsController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserInfoController _userInfoController = Get.find<UserInfoController>();
  final userData = GetStorage();
  final isLogged = GetStorage().read("isLogged") ?? false;
  final userInfo = GetStorage().read("userInfo") ?? {};

  @override
  Widget build(BuildContext context) {
    _userInfoController.getSessionInfo();
    print('**************** $isLogged');
    print('**************** $userInfo');
    if (!isLogged) {
      userData.write('screenTime', 0);
    }
    final hasquitDates = userInfo != null ? userInfo['quitDates'] : null;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        toggleableActiveColor: OurColors.mainColor,

        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
            backgroundColor: OurColors.mainColor),
        // primaryColor: OurColors.mainColor,
        appBarTheme: AppBarTheme(
            backgroundColor: OurColors.mainColor,
            foregroundColor: Colors.white),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey,
          labelColor: OurColors.mainColor,
          indicator: UnderlineTabIndicator(
              // color for indicator (underline)
              borderSide: BorderSide(color: OurColors.mainColor, width: 5)),
        ),
        backgroundColor: OurColors.mainColor,
      ),
      home: isLogged && userInfo != null
          ? hasquitDates != null
              ? CustomBottomNavigationBar()
              : OnBording()
          : SignUp(),
    );
  }
}
