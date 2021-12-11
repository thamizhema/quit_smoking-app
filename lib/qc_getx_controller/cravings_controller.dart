import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/qc_getx_controller/all_info_controller.dart';
import 'package:quit_smoking/qc_getx_controller/user_info_controller.dart';

class CravingsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final getStorage = GetStorage();
  final cravingStrong = 1.0.obs;
  final location = false.obs;
  final feeling = ''.obs;
  final doing = ''.obs;
  final whoWithYou = ''.obs;
  final cravingsList = [].obs;

  getCravingsInfo() async {
    final userInfo = await getStorage.read('userInfo');
    final allCravings = await getStorage.read('cravings');
    final cravingsCheck =
        await _firestore.collection('Cravings').doc(userInfo['email']).get();

    ///TODO: change logic for allCravings != null because if i uninstall the app and get into the app again i have craving data on db but i don't get in local session

    cravingsList(allCravings);

    final cravings =
        await _firestore.collection('Cravings').doc(userInfo['email']).get();
    print('^^^^^^^^^^^^^^^^^^^^^^^^');
    print(userInfo['email']);
    print('^^^^^^^^^^^^^^^^^^^^^^^^');
    if (cravings.data() != null) {
      cravingsList(cravings['cravings']);
      getStorage.write('cravings', cravings['cravings']);
    }
  }

  @override
  void onInit() {
    getCravingsInfo();
    super.onInit();
  }
}
