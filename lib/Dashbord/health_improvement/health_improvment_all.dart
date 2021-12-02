import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/qc_getx_controller/health_improvement_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthImprovementAll extends StatelessWidget {
  HealthImprovementAll({Key? key}) : super(key: key);
  final HealthImprovementController _improvementController =
      Get.find<HealthImprovementController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Improvement'),
      ),
      body: SafeArea(
          child: Obx(
        () => ListView(
          children: List.generate(
            _improvementController.improvementsAll.value.length,
            (index) => _improvementController.improvementsAll.value[index],
          ),
        ),
      )),
    );
  }
}
