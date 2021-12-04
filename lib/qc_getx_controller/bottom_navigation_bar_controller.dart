import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  final pageIndex = 0.obs;

  setPageIndex(index) {
    pageIndex(index);
  }
}
