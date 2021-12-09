import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class MissionWidget extends StatelessWidget {
  MissionWidget(
      {Key? key, this.isCompleted = false, this.title = 'Day', this.onPressed})
      : super(key: key);

  bool isCompleted = false;
  String title;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.grey[200],
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                isCompleted ? 'images/mission.png' : 'images/mission_not.png',
                width: 70,
              ),
              title.text.xl2
                  .color(isCompleted
                      ? OurColors.mainColor
                      : OurColors.secondaryColor)
                  .make(),
              Icon(
                isCompleted ? Icons.done : Icons.lock,
                size: 30,
                color: isCompleted
                    ? OurColors.mainColor
                    : OurColors.secondaryColor,
              ),
            ],
          ).onInkTap(onPressed!),
        ),
      ),
    );
  }
}
