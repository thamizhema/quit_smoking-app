import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserInfoController extends GetxController {
  final userInfo = {}.obs;

  void updateUserInfo(Map userDetails) {
    userInfo.addAll(userDetails);
  }

  getSessionInfo() async {
    final userSession = GetStorage();
    final userSessionData = await userSession.read("userInfo");
    updateUserInfo(userSessionData);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSessionInfo();
  }
}
