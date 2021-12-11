import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/dashboard.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time/smoke_free_time.dart';
import 'package:quit_smoking/Missions/missions.dart';
import 'package:quit_smoking/bottom%20navigation%20bar/bottom_navigation_bar.dart';
import 'package:quit_smoking/qc_getx_controller/mission_controller.dart';

class UserInfoController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final MissionController _missionController = Get.find<MissionController>();
  final getStorage = GetStorage();
  final currentQuitDate = DateTime.now().obs;
  final userInfo = {}.obs;
  final pageIndex = 0.obs;
  final dataCollection = false.obs;
  final userQuitDates = [].obs;
  final quitReason = [].obs;
  final pageController = PageController().obs;
  final ourUser = false.obs;
  final isSmoked = false.obs;

  setCurrentQuitDate(quitdate) {
    currentQuitDate(quitdate);
  }

  void updateUserInfo(Map userDetails) async {
    userInfo.addAll(userDetails);
  }

  void setPageIndex(index) {
    pageIndex(index);
  }

  void setDataCollection(isCompleted) {
    dataCollection(isCompleted);
  }

  getSessionInfo() async {
    final userSessionData = await getStorage.read("userInfo");
    if (userSessionData == null) return;
    updateUserInfo(userSessionData);
  }

  setQuitReason(reason) {
    quitReason.add(reason);
  }

  removeQuitReason(reason) {
    quitReason.remove(reason);
  }

  Map<String, dynamic> userInformation({isDb = true}) {
    DateTime quitDate =
        DateTime.parse(userInfo.value['quitDate'] ?? DateTime.now().toString());
    userQuitDates.value.add(quitDate);

    return {
      'email': userInfo['email'],
      'username': userInfo['username'],
      if (isDb) 'quitDate': userQuitDates.value,
      if (!isDb) 'quitDate': quitDate.toString(),
      'dayOfCigarette': userInfo['dayOfCigarette'] ?? 1,
      'packOfCigarettes': userInfo['packOfCigarettes'] ?? 10,
      'priceOfPack': userInfo['priceOfPack'] ?? 100,
      'addictionOfYears': userInfo['addictionOfYears'] ?? 1,
      'quitReason': userInfo['quitReason'].length == 0
          ? ['Other']
          : userInfo['quitReason'],
      'relapsedCount': userQuitDates.value.length - 1,
    };
  }

  void addUserInfoToDb() async {
    try {
      firestore
          .collection('User')
          .doc(userInfo['email'])
          .set(userInformation(isDb: true));

      firestore
          .collection('Missions')
          .doc(userInfo['email'])
          .set({"missions": mission});
      final isNewUser = getStorage.read('missions');
      if (isNewUser == null) {
        getStorage.write('missions', mission);
      }

      getStorage.write('userInfo', userInformation(isDb: false));
      getStorage.write('isLogged', true);
      Get.offAll(CustomBottomNavigationBar());
      _missionController.getAllMissions();
    } catch (e) {
      print('error data ................... $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSessionInfo();
  }
}
