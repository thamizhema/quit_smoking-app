import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Dashbord/Guided%20Meditation/meditation_card.dart';
import 'package:quit_smoking/Dashbord/Guided%20Meditation/meditation_player.dart';
// import 'package:quit_smoking/practice.dart';
import 'package:velocity_x/velocity_x.dart';

import 'custom_musics.dart';

class SeeAllMeditation extends StatelessWidget {
  SeeAllMeditation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided Meditation'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'Recommended for you'.text.xl.color(OurColors.mainColor).make(),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MeditationCard(
                          title: 'Focus',
                          imagePath: 'images/focus.png',
                          onTap: () {
                            Get.to(MeditationPlayer(
                              typeOfMeditation: 'Focus',
                              title: 'Focus',
                              imagePath: 'images/focus.png',
                              musicPath: 'musics/focus.mp3',
                            ));
                          },
                        ),
                        MeditationCard(
                          title: 'Happiness',
                          imagePath: 'images/happy.jpg',
                          onTap: () {
                            Get.to(MeditationPlayer(
                              typeOfMeditation: 'Happy',
                              title: 'Happy',
                              imagePath: 'images/happy.jpg',
                              musicPath: 'musics/happy.mp3',
                            ));
                          },
                        ),
                        MeditationCard(
                          title: 'Sleep',
                          imagePath: 'images/sleep.jpg',
                          onTap: () {
                            Get.to(MeditationPlayer(
                              typeOfMeditation: 'Sleep',
                              title: 'Sleep',
                              imagePath: 'images/sleep.jpg',
                              musicPath: 'musics/sleep.mp3',
                            ));
                          },
                        ),
                      ],
                    )),
                const SizedBox(height: 25),
                'Listen your own music style'
                    .text
                    .xl
                    .color(OurColors.mainColor)
                    .make(),
                CustomMusics(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
