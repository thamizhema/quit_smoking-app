import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/Guided%20Meditation/guided_meditation.dart';
import 'package:quit_smoking/Dashbord/Health_and_Wellness/helath_and_wellness.dart';
import 'package:quit_smoking/Dashbord/money_saved/money_saved.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time/smoke_free_time.dart';
import 'package:quit_smoking/qc_getx_controller/all_info_controller.dart';

import 'package:velocity_x/velocity_x.dart';

import 'health_improvement/health_improvement.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final getStorage = GetStorage();
  final AllInfoController _allInfoController = Get.find<AllInfoController>();

  List<Widget> dashboardItems = [
    SmokeFreeTime(),
    HealthImprovement(),
    MoneySaved(),
    GuidedMeditation(),
    HealthAndWellness(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStorage.write('isLogged', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            'screen time${_allInfoController.totalInfo.value['totalScreenTime'].toString()}')),
        leading: Icon(Icons.person).onInkTap(
          () {
            print(_allInfoController.totalInfo.value);
          },
        ),
        actions: [
          Icon(Icons.logout).onInkTap(
            () {
              getStorage.write('isLogged', false);
              getStorage.remove('userInfo');
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
            child: ListView.builder(
                itemCount: dashboardItems.length,
                itemBuilder: (context, index) {
                  return dashboardItems[index];
                })),
      ),
    );
  }
}
