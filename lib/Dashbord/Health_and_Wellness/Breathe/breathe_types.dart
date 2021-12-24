import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class BreatheType extends StatelessWidget {
  BreatheType(
      {Key? key,
      this.title,
      this.subtitle,
      this.onPressed,
      this.color,
      this.icon})
      : super(key: key);
  String? title;
  String? subtitle;
  Color? color;
  VoidCallback? onPressed;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      elevation: 5,
      color: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Material(
          color: color,
          child: Container(
            padding: const EdgeInsets.all(15),
            height: context.screenWidth / 1.8,
            width: context.screenWidth / 2.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon),
                const Spacer(),
                '$title'.text.xl2.ellipsis.make(),
                '$subtitle'.text.size(10).maxLines(2).ellipsis.make(),
              ],
            ),
          ).onInkTap(onPressed!),
        ),
      ),
    );
  }
}
