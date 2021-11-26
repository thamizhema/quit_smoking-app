import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    void signinWithFacebook() async {
      try {
        LoginResult loginResult = await FacebookAuth.instance.login();
        final userData = await FacebookAuth.instance.getUserData();

        final facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        print("user info ================================");
        print(userData);
      } catch (e) {
        print('error ===================================');
        print(e);
      }
    }

    void signinWithGoogle() async {
      final googleSignin = GoogleSignIn();
      final googleUser = await googleSignin.signIn();
      if (googleUser == null) return;
      print('google user info ========================');
      print(googleUser);

      final googleAuth = await googleUser.authentication;
      final googleAuthCradintial = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(googleAuthCradintial);
    }

    void signinEmail() async {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: 'thamizh@gmail.com', password: '12345678');
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text(
            'login',
          ),
          onPressed: () {
            signinEmail();
          },
        ),
      ),
    );
  }
}
