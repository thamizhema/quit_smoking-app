import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:quit_smoking/Common/buttons.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time.dart';
import 'package:quit_smoking/Data%20Collection/onbording.dart';
import 'package:quit_smoking/Data%20Collection/welcome_page.dart';
import 'package:quit_smoking/login/email_login.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

class SignUp extends StatelessWidget {
  UserInfoController _userInfoController = Get.find<UserInfoController>();
  final getStorage = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signinWithFacebook() async {
    try {
      LoginResult loginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
      print("user info ================================");
      print(userData);
      Map updateUserInfo = {
        "username": userData['name'],
        "email": userData['email']
      };

      _userInfoController.updateUserInfo(updateUserInfo);

      getStorage.write("userInfo", updateUserInfo);

      final checkUser = await _firestore.collection("User").get();
      bool isCompleted = false;
      for (var i in checkUser.docs) {
        if (i['email'] == updateUserInfo['email']) {
          isCompleted = true;
        }
      }

      if (isCompleted) {
        Get.offAll(SmokeFreeTime(), transition: Transition.cupertino);
      } else {
        Get.offAll(OnBording(), transition: Transition.cupertino);
      }
      getStorage.write('isLogged', true);
    } catch (e) {
      print('error ===================================');
      print(e);
    }
  }

  void signinWithGoogle() async {
    try {
      final googleSignin = GoogleSignIn();
      final googleUser = await googleSignin.signIn();
      if (googleUser == null) return;
      print('google user info ========================');
      print(googleUser);

      final googleAuth = await googleUser.authentication;
      final googleAuthCradintial = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(googleAuthCradintial);
      Map updateUserInfo = {
        "email": googleUser.email,
        "username": googleUser.displayName
      };

      _userInfoController.updateUserInfo(updateUserInfo);

      getStorage.write("userInfo", updateUserInfo);
      final checkUser = await _firestore.collection("User").get();
      bool isCompleted = false;
      for (var i in checkUser.docs) {
        if (i['email'] == updateUserInfo['email']) {
          isCompleted = true;
        }
      }

      if (isCompleted) {
        Get.offAll(SmokeFreeTime(), transition: Transition.cupertino);
      } else {
        Get.offAll(OnBording(), transition: Transition.cupertino);
      }
      getStorage.write('isLogged', true);
    } catch (e) {
      print('google sign error ======================');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  child: Image.asset('images/google_logo.png'),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Flexible(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SignUpButtons(
                        icon: MdiIcons.email,
                        bgColor: const Color(0xff9E301A),
                        textColor: OurColors.mainTextColor,
                        buttonName: "Sign in With Email  ",
                        onPressed: () {
                          Get.to(EmailLogin());
                        },
                      ),
                      SignUpButtons(
                        isImage: true,
                        iconImage: "images/google_logo.png",
                        buttonName: "Sign with Google     ",
                        onPressed: () {
                          signinWithGoogle();
                        },
                      ),
                      SignUpButtons(
                        icon: MdiIcons.facebook,
                        bgColor: OurColors.fbButtonColor,
                        textColor: OurColors.mainTextColor,
                        buttonName: "Sign with Facebook",
                        onPressed: () {
                          signinWithFacebook();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
