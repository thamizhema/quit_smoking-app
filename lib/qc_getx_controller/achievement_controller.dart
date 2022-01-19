import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AchievementController extends GetxController {
  final achievement = [].obs;
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
    getAchievementData();
  }
}
