import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/Breathe/breathe.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/health_and_wellness_itme.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/random_cards.dart';
import 'package:quit_smoking/qc_getx_controller/health_and_wellness_contreller.dart';

List wisdomList = [
  'images/health_wellness/wisdom.jpg',
  'images/health_wellness/breath.jpg',
  'images/health_wellness/yoga.png',
  'images/health_wellness/affirmations.jpg',
  'images/health_wellness/nutrition.jpg',
];
List affirmationList = [
  'images/affirmations/af1.jpg',
  'images/affirmations/af2.jpg',
  'images/affirmations/af3.jpg',
  'images/affirmations/af4.png',
];

final HealthAndWellnessController _wellnessController =
    Get.find<HealthAndWellnessController>();
List<Widget> items = [
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/wisdom.jpg',
    title: 'Wisdom',
    onPressed: () {
      Get.to(
        RandomCards(
          imageList: wisdomList,
          pageController: _wellnessController.wisdomPageController.value,
          setIndexValueForSession: () {
            _wellnessController.getWisdomIndex();
          },
          storageKey: 'wisdom',
        ),
      );
    },
  ),
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/breath.jpg',
    title: 'Breathe',
    onPressed: () {
      Get.to(const Breathe());
    },
  ),
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/yoga.png',
    title: 'Yoga',
    onPressed: () {
      // Get.to(
      //   RandomCards(
      //     imageList: wisdomList,
      //     pageController: _wellnessController.wisdomPageController.value,
      //     setIndexValueForSession: _wellnessController.getWisdomIndex(),
      //     storageKey: 'wisdom',
      //   ),
      // );
    },
  ),
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/affirmations.jpg',
    title: 'Affirmation',
    onPressed: () {
      Get.to(
        RandomCards(
          imageList: affirmationList,
          pageController: _wellnessController.affirmationPageController.value,
          setIndexValueForSession: () {
            _wellnessController.getAffirmationIndex();
          },
          storageKey: 'affirmation',
        ),
      );
    },
  ),
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/nutrition.jpg',
    title: 'Health Tips',
    onPressed: () {
      // Get.to(
      //   RandomCards(
      //     imageList: wisdomList,
      //     pageController: _wellnessController.wisdomPageController.value,
      //     setIndexValueForSession: _wellnessController.getWisdomIndex(),
      //     storageKey: 'wisdom',
      //   ),
      // );
    },
  ),
  HealthAndWellnessItem(
    imagePath: 'images/health_wellness/nutrition.jpg',
    title: 'Nutrition',
    onPressed: () {
      // Get.to(
      //   RandomCards(
      //     imageList: wisdomList,
      //     pageController: _wellnessController.wisdomPageController.value,
      //     setIndexValueForSession: _wellnessController.getWisdomIndex(),
      //     storageKey: 'wisdom',
      //   ),
      // );
    },
  ),
];
