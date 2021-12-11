import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class CravingsSlider extends StatelessWidget {
  CravingsSlider({Key? key}) : super(key: key);
  final CravingsController _cravingsController = Get.find<CravingsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'How strong was your desire to smoke?'.text.xl.make(),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 60,
              ),
              Obx(
                () => Slider(
                    divisions: 5,
                    min: 1,
                    max: 10,
                    activeColor: OurColors.mainColor,
                    inactiveColor: OurColors.secondaryColor,
                    value: _cravingsController.cravingStrong.value,
                    onChanged: (val) {
                      _cravingsController.cravingStrong(val);
                    }),
              ),
              Positioned(
                bottom: 0,
                width: context.screenWidth,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Not at All'.text.green600.make(),
                      'Aaaggh!'.text.green600.make(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
