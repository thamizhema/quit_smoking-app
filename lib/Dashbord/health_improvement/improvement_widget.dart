import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ImprovementWidget extends StatelessWidget {
  ImprovementWidget({
    Key? key,
    this.improvement = "something",
    this.title = 'title',
    this.percentage = 0.0,
    this.percentageLabel = '0',
    this.calculationTime = 0,
    this.totalMinutesOrDays = 0,
    this.isVisible = true,
  }) : super(key: key);
  String improvement;
  String title;
  double percentage;
  String percentageLabel;
  int totalMinutesOrDays;
  int calculationTime;
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return
        // child:
        Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: context.screenWidth / 3.2,
      child: CircularPercentIndicator(
          radius: 100.0,
          percent: ((totalMinutesOrDays * 100) / calculationTime) / 100,
          // totalMinutesOrDays > calculationTime
          //     ? 100 / 100
          //     : ((totalMinutesOrDays * 100) * calculationTime) / 100,
          lineWidth: 8.0,
          progressColor: OurColors.mainColor,
          backgroundColor: OurColors.secondaryColor,
          circularStrokeCap: CircularStrokeCap.round,
          animation: false,
          center: Text(
              '${((totalMinutesOrDays * 100) / calculationTime).toStringAsFixed(0)}%'),
          // Text(
          //     '${totalMinutesOrDays > calculationTime ? '100' : ((calculationTime / 100) * totalMinutesOrDays).toString()}%'),
          footer: title.text.center.lineHeight(3).ellipsis.makeCentered()),
    );
  }
}

class AllImprovement extends StatelessWidget {
  AllImprovement({
    Key? key,
    this.title = 'title',
    this.calculationTime = 0,
    this.totalMinutesOrDays = 0,
    this.footer = '',
  }) : super(key: key);

  String title;
  int totalMinutesOrDays;
  int calculationTime;
  String footer;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      percent: ((totalMinutesOrDays * 100) / calculationTime) / 100,
      lineWidth: 8.0,
      progressColor: OurColors.mainColor,
      backgroundColor: OurColors.secondaryColor,
      circularStrokeCap: CircularStrokeCap.round,
      animation: false,
      center: Text(
          '${((totalMinutesOrDays * 100) / calculationTime).toStringAsFixed(0)}%'),
      // Text(
      //     '${totalMinutesOrDays > calculationTime ? '100' : ((calculationTime / 100) * totalMinutesOrDays).toString()}%'),
      header: title.text.center.lineHeight(4).ellipsis.makeCentered(),
      footer: footer.text.center.lineHeight(4).ellipsis.makeCentered(),
    )
        .box
        .size(
          context.screenWidth / 1.5,
          context.screenWidth / 1.5,
        )
        .white
        .margin(EdgeInsets.symmetric(vertical: 10))
        .shadow
        .rounded
        .makeCentered();
  }
}
