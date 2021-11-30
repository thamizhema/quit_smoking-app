import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Dashbord/smoke_free_time.dart';
import 'package:quit_smoking/qc_getx_controller/smoke_free_time_contreller.dart';
import 'package:velocity_x/velocity_x.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final getStorage = GetStorage();
  final SmokeFreeTimeController _smokeFreeTimeController =
      SmokeFreeTimeController();

  List<Widget> dashboardItems = [
    SmokeFreeTime(),
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
        title: Text('dashboard'),
        leading: Icon(Icons.person).onInkTap(
          () {
            print(getStorage.read('isLogged'));
            print(getStorage.read('userInfo'));
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
