import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/custom_action_chip.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class CravingsInfo extends StatelessWidget {
  CravingsInfo(
      {Key? key,
      this.options,
      this.setOptionElement = '',
      this.onPressed,
      this.title = "title"})
      : super(key: key);
  List? options;
  dynamic setOptionElement;
  VoidCallback? onPressed;
  String title;

  final CravingsController _cravingsController = Get.find<CravingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.xl.make(),
        Obx(
          () => Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              runSpacing: -5,
              children: List.generate(
                options!.length,
                (index) => CustomActionChip(
                  value: options![index],
                  isSelected: setOptionElement.value.contains(options![index]),
                  onPressed: () {
                    setOptionElement(options![index]);
                  },
                ),
              )),
        ),
      ],
    );
  }
}
