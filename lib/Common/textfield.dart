import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    Key? key,
    this.focusNode,
    this.label = "",
    this.hintText = "",
    required this.controller,
    this.autofocus = true,
    this.cursorColor = Colors.green,
    this.suffixIcon = Icons.email,
  }) : super(key: key);
  FocusNode? focusNode;
  String label = "";
  String hintText = '';
  TextEditingController controller;
  bool autofocus = true;
  Color cursorColor = Colors.green;
  IconData suffixIcon = Icons.email;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        TextFormField(
          onTap: () {
            setState(() {});
          },
          controller: widget.controller,
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          cursorColor: widget.cursorColor,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelStyle: TextStyle(color: widget.cursorColor),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: Icon(
              widget.suffixIcon,
              color: widget.focusNode!.hasFocus
                  ? widget.cursorColor
                  : OurColors.secondaryColor,
            ),
          ),
        )
            .box
            .px4
            .customRounded(BorderRadius.circular(5))
            .border(
                color: widget.focusNode!.hasFocus
                    ? widget.cursorColor
                    : OurColors.secondaryColor,
                width: 2)
            .makeCentered(),
      ],
    );
  }
}
