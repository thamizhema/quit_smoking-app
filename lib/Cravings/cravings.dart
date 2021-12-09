import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Cravings/add_cravings.dart';
import 'package:velocity_x/velocity_x.dart';

class Cravings extends StatelessWidget {
  const Cravings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(AddCravings());
        },
      ),
      body: SafeArea(
        child: Container(
          child: 'Cravings'.text.makeCentered(),
        ),
      ),
    );
  }
}
