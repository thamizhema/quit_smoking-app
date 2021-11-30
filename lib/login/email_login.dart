import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/buttons.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/textfield.dart';
import 'package:quit_smoking/Dashbord/dashboard.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time.dart';
import 'package:quit_smoking/Data%20Collection/onbording.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class EmailLogin extends StatefulWidget {
  EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userSession = GetStorage();
  UserInfoController _userInfoController = Get.find<UserInfoController>();

  dynamic invalidEmail;
  dynamic usernameEmpty;
  dynamic passwordError;
  dynamic confirmPasswordError;

  bool ourUser = false;
  bool smoked = false;

  bool validation() {
    setState(() {
      if (!_email.text.validateEmail()) {
        invalidEmail = "Invalid email";
      } else {
        invalidEmail = null;
      }
      if (_username.text.isEmpty) {
        usernameEmpty = "Enter your username";
      } else {
        usernameEmpty = null;
      }
      if (_password.text.length <= 5) {
        passwordError = "password minimum 6 character";
      } else {
        passwordError = null;
      }
      if (_password.text != _confirmPassword.text ||
          _confirmPassword.text.length <= 5) {
        confirmPasswordError = "password mismatch";
      } else {
        confirmPasswordError = null;
      }
    });
    return invalidEmail == null &&
        usernameEmpty == null &&
        passwordError == null &&
        confirmPasswordError == null;
  }

  createEmailAuth(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text, password: _password.text);

      Map updateUserInfo = {"email": _email.text, "username": _username.text};

      _userInfoController.updateUserInfo(updateUserInfo);
      userSession.write("isLogged", true);
      userSession.write("userInfo", updateUserInfo);
      Get.offAll(OnBording(), transition: Transition.cupertino);
      userSession.write('isLogged', true);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      VxToast.show(context,
          msg: e.message.toString(), position: VxToastPosition.top);
    }
  }

  logInWithEmailPassword() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text, password: _password.text);

      if (!smoked) {
        final checkUser = await _firestore.collection("User").get();
        Map getUserData = {};
        for (var i in checkUser.docs) {
          if (i['email'] == _email.text) {
            getUserData = i.data();
            Timestamp date = i['quitDate'][i['quitDate'].length - 1];
            DateTime quitDate = DateTime.fromMicrosecondsSinceEpoch(
                date.microsecondsSinceEpoch);
            getUserData['quitDate'] = quitDate.toString();
            userSession.write('userInfo', getUserData);
            userSession.write('isLogged', true);
          }
        }
        Get.offAll(Dashboard(), transition: Transition.cupertino);
      } else {
        Get.offAll(OnBording(), transition: Transition.cupertino);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      VxToast.show(context,
          msg: e.message.toString(), position: VxToastPosition.top);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(!ourUser ? 'Create Account' : 'Login')
                    .text
                    .size(30)
                    .makeCentered(),
                if (!ourUser)
                  CustomTextField(
                    errorText: usernameEmpty,
                    hintText: 'Username',
                    label: 'Username',
                    suffixIcon: Icons.person,
                    // focusNode: username,
                    controller: _username,
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                CustomTextField(
                  errorText: invalidEmail,
                  hintText: 'Email',
                  label: 'Email',
                  // focusNode: emailNode,
                  controller: _email,
                  padding: EdgeInsets.only(bottom: 15),
                ),
                CustomTextField(
                  errorText: passwordError,
                  hintText: 'Password',
                  label: 'Password',
                  // focusNode: emailNode,
                  obscureText: true,
                  controller: _password,
                  suffixIcon: Icons.lock,
                  padding: EdgeInsets.only(bottom: 15),
                ),
                if (!ourUser)
                  CustomTextField(
                    errorText: confirmPasswordError,
                    hintText: 'Confirm Password',
                    label: 'Confirm Password',
                    // focusNode: emailNode,
                    obscureText: true,
                    controller: _confirmPassword,
                    suffixIcon: Icons.lock,
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                if (ourUser)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Did you Smoke? ${smoked ? "yes" : "No"}"),
                      Row(
                        children: [
                          ActionChip(
                              label: const Text('No')
                                  .text
                                  .color(OurColors.mainTextColor)
                                  .make(),
                              backgroundColor: smoked
                                  ? OurColors.secondaryColor
                                  : OurColors.mainColor,
                              autofocus: true,
                              onPressed: () {
                                setState(() {
                                  smoked = false;
                                });
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                          ActionChip(
                            label: const Text('Yes')
                                .text
                                .color(OurColors.mainTextColor)
                                .make(),
                            backgroundColor: !smoked
                                ? OurColors.secondaryColor
                                : OurColors.mainColor,
                            autofocus: true,
                            onPressed: () {
                              setState(
                                () {
                                  smoked = true;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(3),
                    color: OurColors.mainColor,
                    elevation: 5,
                    child: 'Submit'
                        .text
                        .color(OurColors.mainTextColor)
                        .makeCentered()
                        .box
                        .height(45)
                        .makeCentered()
                        .onInkTap(() {
                      if (!ourUser) {
                        if (validation()) {
                          createEmailAuth(context);
                        }
                      } else {
                        logInWithEmailPassword();
                      }
                    }),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 10,
                ),
                Text(ourUser
                        ? "I don’t  have an account"
                        : "Already have an account")
                    .text
                    .underline
                    .color(OurColors.mainColor)
                    .makeCentered()
                    .onInkTap(() {
                  setState(() {
                    ourUser = !ourUser;
                  });
                }).py12()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
