import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Data%20Collection/welcome_page.dart';
import 'package:quit_smoking/login.dart';
import 'package:quit_smoking/login/sign_up.dart';

class OnBording extends StatelessWidget {
  OnBording({Key? key}) : super(key: key);
  final userData = GetStorage();

  List<Widget> dataCollection = [
    WelcomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          dataCollection[0],
          TextButton(
              onPressed: () {
                userData.write('isLogged', false);
                Get.to(SignUp());
              },
              child: Text('Logout'))
        ],
      ),
    );
  }
}
