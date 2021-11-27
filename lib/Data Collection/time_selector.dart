import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class TimeSelector extends StatefulWidget {
  TimeSelector(
      {Key? key,
      required this.hours,
      required this.minutes,
      required this.isAm,
      this.hoursOnChanged,
      this.minutesOnChanged,
      this.amPm})
      : super(key: key);
  bool isAm = DateTime.now().hour < 12;
  double hours = DateTime.now().hour % 12 == 0 ? 12 : DateTime.now().hour % 12;
  double minutes = DateTime.now().minute.toDouble();
  ValueChanged? hoursOnChanged;
  ValueChanged? minutesOnChanged;
  ValueChanged? amPm;

  @override
  _TimeSelectorState createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.hours
                    .toStringAsFixed(0)
                    .text
                    .color(OurColors.mainTextColor)
                    .xl4
                    .makeCentered()
                    .box
                    .size(70, 70)
                    .p8
                    .roundedSM
                    .color(OurColors.mainColor)
                    .make(),
                ' : '.text.bold.color(OurColors.mainColor).xl3.makeCentered(),
                widget.minutes
                    .toStringAsFixed(0)
                    .text
                    .color(OurColors.mainTextColor)
                    .xl4
                    .makeCentered()
                    .box
                    .size(70, 70)
                    .p8
                    .customRounded(BorderRadius.circular(5))
                    .color(OurColors.mainColor)
                    .make(),
              ],
            ),
          ),
          //  slider
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
              ),
              "Hours".text.xl.bold.makeCentered().positioned(top: 0, left: 20),
              Slider(
                      activeColor: OurColors.mainColor,
                      inactiveColor: OurColors.secondaryColor,
                      min: 1,
                      max: 12,
                      value: widget.hours,
                      onChanged: widget.hoursOnChanged)
                  .positioned(bottom: 0, width: context.screenWidth)
            ],
          ),

          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 60,
              ),
              "Minutes"
                  .text
                  .xl
                  .bold
                  .makeCentered()
                  .positioned(top: 0, left: 20),
              Slider(
                      activeColor: OurColors.mainColor,
                      inactiveColor: OurColors.secondaryColor,
                      min: 0,
                      max: 60,
                      value: widget.minutes,
                      onChanged: widget.minutesOnChanged)
                  .positioned(bottom: 0, width: context.screenWidth)
            ],
          ),

          //  switch
          FlutterSwitch(
              width: 70,
              showOnOff: true,
              activeText: "AM",
              inactiveText: "PM",
              activeTextColor: OurColors.mainTextColor,
              inactiveTextColor: OurColors.mainTextColor,
              inactiveColor: OurColors.mainColor,
              activeColor: OurColors.mainColor,
              value: widget.isAm,
              onToggle: widget.amPm!),
        ],
      ),
    );
  }
}
