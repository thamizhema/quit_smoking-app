import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomActionChip extends StatelessWidget {
  CustomActionChip(
      {Key? key,
      this.value = "Other",
      this.isSelected = false,
      required this.onPressed})
      : super(key: key);
  String value;
  bool isSelected = false;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      child: ActionChip(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
        label: value.text.color(OurColors.mainTextColor).make(),
        backgroundColor: isSelected ? OurColors.mainColor : Colors.grey,
        onPressed: onPressed!,
      ),
    );
  }
}
