import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HealthAndWellnessController extends GetxController {
  final getStorage = GetStorage();
  final wisdomPageController = PageController().obs;
  final affirmationPageController = PageController().obs;

  final wisdomImageIndex = 0.obs;

  void randomAffirmation(List wisdomList) {
    if (wisdomImageIndex.value == wisdomList.length - 1) {
      wisdomImageIndex(0);
    }
    wisdomImageIndex(wisdomImageIndex.value + 1);
  }

  getWisdomIndex() {
    wisdomPageController(
      PageController(
        initialPage: getStorage.read('wisdom'),
      ),
    );
  }

  getAffirmationIndex() {
    wisdomPageController(
      PageController(
        initialPage: getStorage.read('affirmation'),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    wisdomPageController(
      PageController(
        initialPage: getStorage.read('wisdom') ?? 0,
      ),
    );
    affirmationPageController(
      PageController(
        initialPage: getStorage.read('affirmation') ?? 0,
      ),
    );
  }
}
