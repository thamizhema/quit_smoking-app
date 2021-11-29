import 'package:flutter/material.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutCigarettes extends StatelessWidget {
  AboutCigarettes({
    Key? key,
    this.question = "your question",
    this.max = 999,
    this.min = 0,
    this.step = 1,
    this.onChange,
    this.divider = true,
    this.initialValue = 1,
  }) : super(key: key);
  String question;
  int min;
  int max;
  int step;
  ValueChanged? onChange;
  bool divider = true;
  int initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          question.text.bold.make(),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3),
              color: OurColors.mainColor,
              child: VxStepper(
                disableInput: false,
                defaultValue: initialValue,
                min: min,
                max: max,
                step: step,
                actionButtonColor: OurColors.mainColor,
                inputBoxColor: OurColors.mainTextColor,
                inputTextColor: OurColors.mainColor,
                actionIconColor: OurColors.mainTextColor,
                onChange: onChange,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (divider)
            const Divider(
              thickness: 2,
            ),
        ],
      ),
    );
  }
}
