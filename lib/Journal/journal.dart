import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Journal/journal_form_widget.dart';
import 'package:quit_smoking/Journal/see_all_journal.dart';
import 'package:quit_smoking/qc_getx_controller/journal_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class Journal extends StatelessWidget {
  Journal({Key? key}) : super(key: key);
  final JournalController _journalController = Get.find<JournalController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Daily Journal',
            style: TextStyle(color: Color(0xff2D2D2D)),
          ),
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
          actions: [
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () async {
                await _journalController.getAllJournal();
                Get.to(SeeAllJournal(), transition: Transition.cupertino);
              },
              splashRadius: 20,
              color: Colors.black,
              icon: Icon(Icons.list),
            )
          ],
        ),
        body: TabBarView(
          children: [
            JournalFormWidget(),
            JournalFormWidget(
              isMorning: false,
              title1:
                  'How did I do with uplifting someone and improving the environment today?',
              title2:
                  'What lessons did I learn today and how will I apply this in the future?',
              title3: 'Today\'s reflections...',
            ),
          ],
        ),
      ),
    );
  }
}
