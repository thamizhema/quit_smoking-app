import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MissionController extends GetxController {
  final getStorage = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final allMission = [].obs;

  updateMission({index, isCompleted = false, notes = ''}) async {
    allMission.value[index]['isCompleted'] = isCompleted;
    allMission.value[index]['notes'] = notes;
    _firestore
        .collection('Missions')
        .doc(await getStorage.read('userInfo')['email'])
        .set({'missions': allMission.value});
  }

  getAllMissions() async {
    try {
      final userinfo = await getStorage.read('userInfo');
      final missionData =
          await _firestore.collection('Missions').doc(userinfo['email']).get();

      allMission(missionData['missions']);
    } catch (e) {
      List missions = getStorage.read('missions') ?? [{}];
      allMission(missions);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getAllMissions();
  }
}
