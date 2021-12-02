import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/explore_button.dart';
import 'package:quit_smoking/Dashbord/health_improvement/health_improvment_all.dart';
import 'package:quit_smoking/qc_getx_controller/health_improvement_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthImprovement extends StatelessWidget {
  HealthImprovement({Key? key}) : super(key: key);
  final HealthImprovementController _improvementController =
      Get.find<HealthImprovementController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          'Health Improvement'.text.make(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => Row(
                children: List.generate(
                  3,
                  (index) {
                    if (_improvementController.improvements.value.isNotEmpty) {
                      return _improvementController.improvements.value[index];
                    } else {
                      return Text('Loading');
                    }
                  },
                ),
              ),
            ),
          ),
          ExploreButton(
            onPressed: () {
              Get.to(HealthImprovementAll(), transition: Transition.cupertino);
            },
          ),
        ],
      ),
    );
  }
}
