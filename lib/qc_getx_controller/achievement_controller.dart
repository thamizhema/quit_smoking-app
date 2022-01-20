import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AchievementController extends GetxController {
  /// un comment when api hosted
  // final achievement = [].obs;

  ///sample api
  final achievement = [
    {
      "title": "10 Minutes smoke free",
      "isCompleted": false,
      "valueType": "minutes",
      "value": 10,
      "id": 1
    },
    {
      "title": "60 Minutes smoke free",
      "isCompleted": false,
      "valueType": "minutes",
      "value": 60,
      "id": 2
    },
    {
      "title": "5 Hours smoke free",
      "isCompleted": false,
      "valueType": "hours",
      "value": 5,
      "id": 3
    },
    {
      "title": "400 Day smoke free",
      "isCompleted": false,
      "valueType": "days",
      "value": 400,
      "id": 4
    },
    {
      "title": "14 months smoke free",
      "isCompleted": false,
      "valueType": "months",
      "value": 14,
      "id": 5
    },
    {
      "title": "2 year smoke free",
      "isCompleted": false,
      "valueType": "years",
      "value": 2,
      "id": 6
    }
  ].obs;
  final allAchievementWidgets = [].obs;
  final getStorage = GetStorage();
  getAchievementData() async {
    try {
      var dio = Dio();
      final userId = await getStorage.read('userInfo');

      final response = await dio.get("http://192.168.0.40:4000/achievement");
      if (response.statusCode == 200) {
        final allDatas = response.data;
        for (dynamic usersData in allDatas) {
          if (usersData["id"] == userId['email']) {
            achievement(usersData['achievements']);
          }
        }
      }
    } catch (e) {
      print(
        'achievement exception $e',
      );
    }
    print(achievement);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    /// un comment when api hosted
    // getAchievementData();
  }
}
