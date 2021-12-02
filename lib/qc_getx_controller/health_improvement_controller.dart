import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/health_improvement/improvement_widget.dart';

class HealthImprovementController extends GetxController {
  Timer? timer;
  final getStorage = GetStorage();
  final quitDate = DateTime.now().obs;
  final totalMinutes = 0.obs;
  final totalDays = 0.obs;
  final showList = [].obs;

  final improvements = [].obs;
  final improvementsAll = [].obs;

  getTime() async {
    Map userInfo = await getStorage.read('userInfo');

    quitDate(DateTime.parse(userInfo['quitDate']));

    startTimer();
  }

  updateFunction() {
    totalMinutes(quitDate.value.difference(DateTime.now()).inMinutes.abs());
    totalDays(quitDate.value.difference(DateTime.now()).inDays.abs());
    setShowListItem();

    // Map improvementsList = ;
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => updateFunction());
  }

  setShowListItem() {
    List<Map> allImp = [
      {
        'title': 'Pules Rate',
        'calculationTime': 20,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 20 < totalMinutes.value,
        'description': '20 Minutes',
      },
      {
        'title': 'Oxygen Level',
        'calculationTime': 480,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 480 < totalMinutes.value,
        'description': '8 Hours',
      },
      {
        'title': 'Carbon monoxide level',
        'calculationTime': 1440,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 1440 < totalMinutes.value,
        'description': '24 Hours'
      },
      {
        'title': 'Nicotine expelled from body',
        'calculationTime': 2520,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 2520 < totalMinutes.value,
        'description': '42 Hours'
      },
      {
        'title': 'Taste and smell',
        'calculationTime': 14400,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 14400 < totalMinutes.value,
        'description': '10 Days'
      },
      {
        'title': 'Breathing',
        'calculationTime': 120960,
        'totalMinutesOrDays': totalMinutes.value,
        'isFinish': 120960 < totalMinutes.value,
        'description': '12 Weeks'
      },
      {
        'title': 'Energy levels',
        'calculationTime': 273,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 273 < totalDays.value,
        'description': '9 Months'
      },
      {
        'title': 'Bed Breath',
        'calculationTime': 365,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 365 < totalDays.value,
        'description': '1 Years'
      },
      {
        'title': 'Tooth Stationing',
        'calculationTime': 1825,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 1825 < totalDays.value,
        'description': '5 Years'
      },
      {
        'title': 'Cums and Teeth',
        'calculationTime': 3650,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 3650 < totalDays.value,
        'description': '10 Years'
      },
      {
        'title': 'Circulation',
        'calculationTime': 5475,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 5475 < totalDays.value,
        'description': '15 Years'
      },
      {
        'title': 'Gum texture',
        'calculationTime': 7300,
        'totalMinutesOrDays': totalDays.value,
        'isFinish': 7300 < totalDays.value,
        'description': '20 Years'
      },
    ];
    List currentImp = [];
    List allIMap = [];
    for (var i in allImp) {
      if (!i['isFinish']) {
        currentImp.add(ImprovementWidget(
          title: i['title'],
          calculationTime: i['calculationTime'],
          totalMinutesOrDays: i['totalMinutesOrDays'],
        ));
      }
      allIMap.add(AllImprovement(
        title: i['title'],
        calculationTime: i['isFinish'] ? 100 : i['calculationTime'],
        totalMinutesOrDays: i['isFinish'] ? 100 : i['totalMinutesOrDays'],
      ));
    }
    improvementsAll(allIMap);
    improvements(currentImp);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTime();
  }
}
