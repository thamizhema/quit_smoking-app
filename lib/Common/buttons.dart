import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpButtons extends StatelessWidget {
  SignUpButtons({
    Key? key,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.grey,
    this.isImage = false,
    this.iconImage,
    this.buttonName = "Sign in With Email",
    required this.onPressed,
  }) : super(key: key);
  IconData? icon = Icons.mail;
  Color? bgColor;
  Color? textColor;
  bool isImage;
  String? iconImage;
  String buttonName;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(5),
      elevation: 5,
      color: Colors.black26,
      child: SizedBox(
          height: 50,
          width: context.screenWidth,
          child: Material(
            borderRadius: BorderRadius.circular(5),
            color: bgColor,
            child: InkWell(
              onTap: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isImage
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset('$iconImage'),
                        )
                      : Icon(
                          icon,
                          size: 30,
                          color: textColor,
                        ),
                  const SizedBox(
                    width: 30,
                  ),
                  buttonName.text.medium.color(textColor!).makeCentered(),
                ],
              ),
            ),
          )),
    );
  }
}
