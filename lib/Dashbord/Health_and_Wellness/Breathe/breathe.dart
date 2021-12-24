import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/Breathe/breath_timer.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/Breathe/breathe_types.dart';
import 'package:velocity_x/velocity_x.dart';

class Breathe extends StatelessWidget {
  const Breathe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Breathe'),
      ),
      body: SafeArea(
        child: Container(
          width: context.screenWidth,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BreatheType(
                    icon: FontAwesomeIcons.equals,
                    title: 'Equal\nBreathing',
                    subtitle: 'Equal Breathing helps you to relax and focus.',
                    color: const Color(0xffE4FFEF),
                    onPressed: () {
                      Get.to(BreatheTimer());
                    },
                  ),
                  const SizedBox(width: 22),
                  BreatheType(
                    icon: FontAwesomeIcons.square,
                    title: 'Box\nBreathing',
                    subtitle: 'Equal Breathing helps you to relax and focus.',
                    color: const Color(0xffE4FDFF),
                    onPressed: () {
                      Get.to(BreatheTimer());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BreatheType(
                    icon: FontAwesomeIcons.sortNumericDown,
                    title: '4-7-8 \nBreathing',
                    subtitle: 'Equal Breathing helps you to relax and focus.',
                    color: const Color(0xffFFF4E4),
                    onPressed: () {
                      Get.to(BreatheTimer());
                    },
                  ),
                  const SizedBox(width: 22),
                  BreatheType(
                    icon: FontAwesomeIcons.pause,
                    title: 'Breath\nHolding Test',
                    subtitle: 'Equal Breathing helps you to relax and focus.',
                    color: const Color(0xffFFE4E4),
                    onPressed: () {
                      Get.to(BreatheTimer());
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
