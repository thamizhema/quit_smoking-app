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

import 'package:quit_smoking/Data%20Collection/onbording.dart';

import 'package:quit_smoking/bottom%20navigation%20bar/bottom_navigation_bar.dart';
import 'package:quit_smoking/login/email_login.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUp extends StatelessWidget {
  UserInfoController _userInfoController = Get.find<UserInfoController>();
  final getStorage = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void signinWithFacebook(BuildContext context) async {
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
      Map getUserData = {};
      bool isCompleted = false;
      print('chhhhhhhhhhhh ${checkUser.docs.isNotEmpty}');
      if (checkUser.docs.isNotEmpty) {
        for (var i in checkUser.docs) {
          if (i['email'] == updateUserInfo['email']) {
            isCompleted = true;
            getUserData = i.data();
            _userInfoController.userquitDatess(i['quitDates']);
            Timestamp date = i['quitDates'][i['relapsedCount']];
            DateTime quitDates = DateTime.fromMicrosecondsSinceEpoch(
                date.microsecondsSinceEpoch);
            getUserData['quitDates'] = quitDates.toString();
            getStorage.write('userInfo', getUserData);
          }
        }
        final missionData = await _firestore
            .collection('Missions')
            .doc(updateUserInfo['email'])
            .get();
        getStorage.write('missions', missionData['missions']);
        getStorage.write('isLogged', true);
        if (isCompleted) {
          VxDialog.showConfirmation(
            context,
            content: "welcome",
            title: 'Did you Smoked',
            confirm: 'Yes'.text.white.makeCentered(),
            cancel: "No".text.white.makeCentered(),
            onCancelPress: () {
              getStorage.write('isLogged', true);
              Get.offAll(CustomBottomNavigationBar(),
                  transition: Transition.cupertino);
            },
            onConfirmPress: () {
              getStorage.write('isLogged', true);
              Get.offAll(OnBording(), transition: Transition.cupertino);
            },
          );
        } else {
          print('fb sign up else');
        }
      } else {
        getStorage.write('isLogged', true);
        Get.offAll(OnBording(), transition: Transition.cupertino);
      }
    } catch (e) {
      print('error ===================================');
      print(e);
    }
  }

  void signinWithGoogle(BuildContext context) async {
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
      Map getUserData = {};
      bool isCompleted = false;
      if (checkUser.docs.isNotEmpty) {
        for (var i in checkUser.docs) {
          if (i['email'] == updateUserInfo['email']) {
            isCompleted = true;
            getUserData = i.data();
            _userInfoController.userquitDatess(i['quitDates']);
            Timestamp date = i['quitDates'][i['relapsedCount']];
            DateTime quitDates = DateTime.fromMicrosecondsSinceEpoch(
                date.microsecondsSinceEpoch);
            getUserData['quitDates'] = quitDates.toString();
            getStorage.write('userInfo', getUserData);
          }
        }
        final missionData = await _firestore
            .collection('Missions')
            .doc(updateUserInfo['email'])
            .get();
        getStorage.write('missions', missionData['missions']);
        getStorage.write('isLogged', true);
        if (isCompleted) {
          VxDialog.showConfirmation(
            context,
            content: "welcome",
            title: 'Did you Smoked',
            confirm: 'Yes'.text.white.makeCentered(),
            cancel: "No".text.white.makeCentered(),
            onCancelPress: () {
              getStorage.write('isLogged', true);
              Get.offAll(CustomBottomNavigationBar(),
                  transition: Transition.cupertino);
            },
            onConfirmPress: () {
              getStorage.write('isLogged', true);
              Get.offAll(OnBording(), transition: Transition.cupertino);
            },
          );
        } else {
          print('google sign up else');
        }
      } else {
        getStorage.write('isLogged', true);
        Get.offAll(OnBording(), transition: Transition.cupertino);
      }
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: context.screenWidth,
                  child: Image.asset('images/splash.jpg'),
                ),
              ),
              Container(
                height: 250,
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
                        signinWithGoogle(context);
                      },
                    ),
                    SignUpButtons(
                      icon: MdiIcons.facebook,
                      bgColor: OurColors.fbButtonColor,
                      textColor: OurColors.mainTextColor,
                      buttonName: "Sign with Facebook",
                      onPressed: () {
                        signinWithFacebook(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
