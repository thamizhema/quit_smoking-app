import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AllInfoController extends GetxController {
  Timer? timer;
  final getStorage = GetStorage();
  final quitDate = DateTime.now().obs;
  final userInfo = {}.obs;
  final totalMinutes = 0.obs;
  final totalDays = 0.obs;
  final totalCigarette = 0.0.obs;
  final totalMoneySaved = 0.0.obs;
  final totalInfo = {}.obs;
  final totalScreenTime = 0.obs;

  getTime() async {
    Map sessionInfo = await getStorage.read('userInfo');
    totalScreenTime(getStorage.read('screenTime') ?? 0);
    userInfo(sessionInfo);
    quitDate(DateTime.parse(sessionInfo['quitDate']));
    startTimer();
  }

  updateFunction() {
    totalMinutes(quitDate.value.difference(DateTime.now()).inMinutes.abs());
    totalDays(quitDate.value.difference(DateTime.now()).inDays.abs());
    totalCigarette((userInfo['dayOfCigarette'] / 1440) * totalMinutes.value);
    totalMoneySaved((userInfo['priceOfPack'] / userInfo['packOfCigarettes']) *
        totalCigarette.value);
    totalScreenTime(totalScreenTime.value + 1);
    getStorage.write('screenTime', totalScreenTime.value);
    Map allInfo = {
      'totalDays': totalDays,
      'totalCigarette': totalCigarette,
      'totalMoneySaved': totalMoneySaved,
      'totalScreenTime': totalScreenTime,
    };
    totalInfo(allInfo);
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => updateFunction());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTime();
  }
}
