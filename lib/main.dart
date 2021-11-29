import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time.dart';
import 'package:quit_smoking/Data%20Collection/onbording.dart';
import 'package:quit_smoking/Data%20Collection/welcome_page.dart';

import 'package:quit_smoking/login/sign_up.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(UserInfoController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserInfoController _userInfoController = Get.find<UserInfoController>();
  final userData = GetStorage();
  bool isLogged = GetStorage().read("isLogged") ?? false;

  @override
  Widget build(BuildContext context) {
    _userInfoController.getSessionInfo();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      home: isLogged ? SmokeFreeTime() : SignUp(),
    );
  }
}
