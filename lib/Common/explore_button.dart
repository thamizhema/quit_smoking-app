import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ExploreButton extends StatelessWidget {
  ExploreButton({Key? key, this.onPressed}) : super(key: key);
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: OurColors.mainColor,
        child: 'Explore'
            .text
            .white
            .makeCentered()
            .box
            .size(100, 30)
            .make()
            .onInkTap(onPressed!),
      ),
    );
  }
}
