import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Cravings/add_cravings.dart';
import 'package:quit_smoking/practice.dart';
import 'package:velocity_x/velocity_x.dart';

class Cravings extends StatelessWidget {
  const Cravings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cravings'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          Get.to(AddCravings());
        },
      ),
      body: SafeArea(
        child: Container(
          height: context.screenHeight / 1.5,
          child: CravingsChart(),
        ),
      ),
    );
  }
}
