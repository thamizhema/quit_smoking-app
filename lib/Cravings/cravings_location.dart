import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class CravingLocation extends StatelessWidget {
  CravingLocation({Key? key}) : super(key: key);
  final CravingsController _cravingsController = Get.find<CravingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        'Add your location'.text.xl.make(),
        Obx(
          () => Switch(
              value: _cravingsController.location.value,
              onChanged: (value) {
                _cravingsController.location(value);
              }),
        )
      ],
    );
  }
}
