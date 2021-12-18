import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quit_smoking/Journal/journal_list.dart';
import 'package:quit_smoking/Journal/read_journal.dart';
import 'package:quit_smoking/qc_getx_controller/journal_controller.dart';

class JournalTypes extends StatelessWidget {
  JournalTypes({Key? key, this.fieldKey = 'morningReflection'})
      : super(key: key);
  final JournalController _journalController = Get.find<JournalController>();
  String convertDate(String date) {
    DateTime fullDate = DateTime.parse(date);

    return '${fullDate.day}-${fullDate.month}-${fullDate.year}';
  }

  String fieldKey;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: _journalController.allJournal.isEmpty
          ? null
          : Obx(
              () => ListView.builder(
                  itemCount:
                      _journalController.allJournal.value[fieldKey].length,
                  itemBuilder: (context, index) {
                    final reflection = _journalController
                        .allJournal.value[fieldKey].keys
                        .toList();
                    String label = convertDate(reflection[index]);
                    final notes = _journalController
                        .allJournal.value[fieldKey].values
                        .toList()[index];
                    print(notes);
                    return JournalList(
                      title: label,
                      notes: notes,
                      onPressed: () {
                        Get.to(ReadJournal(
                          title1:
                              'How did I do with uplifting someone and improving the environment this Day',
                          title2:
                              'What lessons did I learn this day and how will I apply this in the future',
                          title3: 'Today\'s reflections...',
                          memory: notes,
                        ));
                      },
                    );
                  }),
            ),
    );
  }
}
