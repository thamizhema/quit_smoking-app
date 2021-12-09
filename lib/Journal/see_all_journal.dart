import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Journal/journal_types.dart';
import 'package:quit_smoking/qc_getx_controller/journal_controller.dart';

class SeeAllJournal extends StatelessWidget {
  SeeAllJournal({Key? key}) : super(key: key);
  // final JournalController _journalController = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'All Journal',
              style: TextStyle(color: Color(0xff2D2D2D)),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Morning Reflection',
                  icon: Icon(Icons.wb_sunny_sharp),
                ),
                Tab(
                  text: 'Night Reflection',
                  icon: Icon(Icons.nightlight_round),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            JournalTypes(),
            JournalTypes(
              fieldKey: 'nightReflection',
            ),
          ])),
    );
  }
}
