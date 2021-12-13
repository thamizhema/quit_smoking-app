import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

class PurchaseButton extends StatelessWidget {
  PurchaseButton(
      {Key? key,
      this.buttonName = 'button name',
      this.isOutlineButton = false,
      this.buttonColor = Colors.green,
      this.onPressed})
      : super(key: key);
  String buttonName;
  bool isOutlineButton = false;
  VoidCallback? onPressed;
  Color buttonColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: isOutlineButton ? null : buttonColor,
      child: buttonName.text.bold
          .color(isOutlineButton ? buttonColor : Colors.white)
          .makeCentered()
          .box
          .size(context.screenWidth, 50)
          .border(
              color: isOutlineButton ? buttonColor : Colors.transparent,
              width: 2)
          .roundedSM
          .makeCentered()
          .onInkTap(onPressed!),
    );
  }
}
