import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class BreatheTimer extends StatefulWidget {
  const BreatheTimer({Key? key}) : super(key: key);

  @override
  _BreatheTimerState createState() => _BreatheTimerState();
}

class _BreatheTimerState extends State<BreatheTimer> {
  double width = 100;
  double height = 100;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: 'Breathe'.text.make(),
      ),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Container(
              width: context.screenWidth / 1.5,
              height: context.screenWidth / 1.5,
              decoration: BoxDecoration(
                color: Color(0xffD0FFE3),
                borderRadius: BorderRadius.circular(300),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xffA8F9C9),
                borderRadius: BorderRadius.circular(300),
              ),
              child: '3'.text.xl6.color(OurColors.mainColor).makeCentered(),
            ),
          ),
          '00:10'
              .text
              .xl2
              .coolGray400
              .makeCentered()
              .positioned(top: context.screenHeight / 4.5),
          'Breathe In'
              .text
              .xl2
              .coolGray400
              .makeCentered()
              .positioned(bottom: context.screenHeight / 4.5),
          Positioned(
            bottom: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Material(
                color: OurColors.mainColor,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.redo,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      'Repeat'.text.white.xl2.make(),
                    ],
                  ).onInkTap(() {}),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
