import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MoneySavedController extends GetxController {
  Timer? timer;
  final getStorage = GetStorage();
  final totalMinutes = 0.obs;
  final minutesOfCost = 0.0.obs;
  final perMinutesCigarettePrice = 0.0.obs;
  final quitDate = DateTime.now().obs;

  final perDayOfMoneySaved = 0.0.obs;
  final perMonthOfMoneySaved = 0.0.obs;
  final perYearOfMoneySaved = 0.0.obs;

  final moneySaved = 0.0.obs;

  getTime() async {
    Map userInfo = await getStorage.read('userInfo');
    if (userInfo != null) {
      quitDate(DateTime.parse(userInfo['quitDate']));
      int dayOfCigarette = userInfo['dayOfCigarette'];
      int packOfCigarettes = userInfo['packOfCigarettes'];
      int priceOfPack = userInfo['priceOfPack'];
      perMinutesCigarettePrice(
          ((priceOfPack / packOfCigarettes) * dayOfCigarette) / 1440);
      perDayOfMoneySaved((priceOfPack / packOfCigarettes) * dayOfCigarette);
      perMonthOfMoneySaved((priceOfPack / packOfCigarettes) * 30.5);
      perYearOfMoneySaved((priceOfPack / packOfCigarettes) * 365);
      getMinutes();
    } else {
      print('got null value');
    }
  }

  getMinutes() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      totalMinutes(quitDate.value.difference(DateTime.now()).inMinutes.abs());
      moneySaved(perMinutesCigarettePrice.value * totalMinutes.value);
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTime();
  }
}
