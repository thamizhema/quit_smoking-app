import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

class SmokeFreeTimeController extends GetxController {
  Timer? timer;
  // DateTime pikedDate = DateTime(2020, 11, 6, 11, 30);
  dynamic totalSeconds;
  int seconds = 0, minutes = 0, hours = 0, days = 0, months = 0, years = 0;
  final getStorage = GetStorage();

  final quitDate = DateTime.now().obs;
  final RxMap<String, int> countdown = {
    'years': 0,
    'months': 0,
    'days': 0,
    'hours': 0,
    'minutes': 0,
    'seconds': 0,
  }.obs;
  setQuitDate(date) {
    quitDate(date);
  }

  setCountdown(Map<String, int> times) {
    countdown(times);
  }

  /// timer
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => updateFunction());
  }

  updateFunction() {
    totalSeconds = quitDate.value.difference(DateTime.now()).inSeconds;
    seconds = totalSeconds!.abs() % 60;
    int totalMinuts = totalSeconds!.abs() ~/ 60;
    minutes = totalMinuts % 60;
    int totalHours = totalMinuts ~/ 60;
    hours = totalHours % 24;
    int totalDays = totalHours ~/ 24;
    days = totalDays % 30;
    dynamic totalMonth = totalDays ~/ 30;
    months = totalMonth % 12;
    years = totalMonth ~/ 12;

    // print('Date: $years/$months/$days\nTime$hours:$minutes:$seconds');
    Map<String, int> times = {
      'years': years,
      'months': months,
      'days': days,
      'hours': hours,
      'minutes': minutes,
      'seconds': seconds
    };
    setCountdown(times);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    DateTime getQuitDate =
        DateTime.parse(getStorage.read('userInfo')['quitDate']);
    setQuitDate(getQuitDate);
    startTimer();
  }
}
