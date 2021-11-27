import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ContentTitle extends StatelessWidget {
  ContentTitle({Key? key, this.title = "title", this.subtitle = "subtitle"})
      : super(key: key);
  String title;
  String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 1.3,
      child: Column(children: [
        title.text.bold.size(18).align(TextAlign.center).makeCentered(),
        const SizedBox(
          height: 10,
        ),
        subtitle.text.makeCentered()
      ]),
    );
  }
}
