import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DateTimeToggle extends StatefulWidget {
  DateTimeToggle({
    Key? key,
    this.onPressed,
    this.leftRadius = 5,
    this.rightRadius = 5,
    this.buttonText = "button text",
    this.textColor = Colors.white,
    this.icon = Icons.calendar_today,
    this.backgroundColor,
  }) : super(key: key);
  VoidCallback? onPressed;
  double leftRadius;
  double rightRadius;
  String buttonText;
  Color textColor;
  IconData icon;
  Color? backgroundColor;

  @override
  _DateTimeToggleState createState() => _DateTimeToggleState();
}

class _DateTimeToggleState extends State<DateTimeToggle> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(widget.leftRadius - 2),
        bottomLeft: Radius.circular(widget.leftRadius - 2),
        topRight: Radius.circular(widget.rightRadius - 2),
        bottomRight: Radius.circular(widget.rightRadius - 2),
      ),
      color: widget.backgroundColor,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: widget.textColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.buttonText,
              style: TextStyle(
                  color: widget.textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        width: context.screenWidth / 2,
      ).onInkTap(widget.onPressed!),
    )
        .box
        .customRounded(BorderRadius.only(
          topLeft: Radius.circular(widget.leftRadius),
          bottomLeft: Radius.circular(widget.leftRadius),
          topRight: Radius.circular(widget.rightRadius),
          bottomRight: Radius.circular(widget.rightRadius),
        ))
        .border(color: Vx.green900, width: 2)
        .make();
  }
}
