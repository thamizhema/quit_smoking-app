import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AllInfoController extends GetxController {
  Timer? timer;
  final getStorage = GetStorage();
  final quitDates = DateTime.now().obs;
  final userInfo = {}.obs;
  final totalMinutes = 0.obs;
  final totalHours = 0.obs;
  final totalDays = 0.obs;
  final totalMonths = 0.obs;
  final totalYears = 0.obs;
  final totalCigarette = 0.0.obs;
  final totalMoneySaved = 0.0.obs;
  final totalInfo = {}.obs;
  final totalScreenTime = 0.obs;

  getTime() async {
    Map sessionInfo = await getStorage.read('userInfo');
    totalScreenTime(getStorage.read('screenTime') ?? 0);
    userInfo(sessionInfo);
    quitDates(DateTime.parse(sessionInfo['quitDates']));
    startTimer();
  }

  updateFunction() {
    totalMinutes(quitDates.value.difference(DateTime.now()).inMinutes.abs());
    totalDays(quitDates.value.difference(DateTime.now()).inDays.abs());
    totalHours(quitDates.value.difference(DateTime.now()).inHours.abs());
    totalMonths(quitDates.value.difference(DateTime.now()).inDays.abs() ~/ 30);
    totalYears(quitDates.value.difference(DateTime.now()).inDays.abs() ~/ 365);

    totalCigarette((userInfo['dayOfCFags'] / 1440) * totalMinutes.value);
    totalMoneySaved((userInfo['priceOfPack'] / userInfo['packOfFags']) *
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
