import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/textfield.dart';

import 'package:velocity_x/velocity_x.dart';

class JournalFormWidget extends StatelessWidget {
  JournalFormWidget({
    Key? key,
    this.title1 = 'I am grateful for : ',
    this.title2 = 'Who  will I uplift today and how will i do so? : ',
    this.title3 = 'How can i improve the environment today?',
    this.isMorning = true,
  }) : super(key: key);
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  String title1;
  String title2;
  String title3;
  bool isMorning = true;
  final getStorage = GetStorage();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomTextField(
            label: title1,
            hintText: 'Write here',
            controller: controller1,
            hasIcon: false,
            autofocus: false,
            maxLines: 3,
          ),
          CustomTextField(
            label: title2,
            hintText: 'Write here',
            controller: controller2,
            hasIcon: false,
            autofocus: false,
            maxLines: 3,
          ),
          CustomTextField(
            label: title3,
            hintText: 'Write here',
            controller: controller3,
            hasIcon: false,
            autofocus: false,
            maxLines: 3,
          ),
          SizedBox(
            width: context.screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Material(
                color: OurColors.mainColor,
                child: 'Save'
                    .text
                    .white
                    .makeCentered()
                    .box
                    .height(50)
                    .makeCentered()
                    .onInkTap(() async {
                  if (controller1.text.isNotEmpty ||
                      controller2.text.isNotEmpty ||
                      controller3.text.isNotEmpty) {
                    Map userInfo = await getStorage.read('userInfo');
                    final journalTest = await _firestore
                        .collection("Journal")
                        .doc(userInfo['email'])
                        .get();
                    if (journalTest.data() == null) {
                      _firestore
                          .collection("Journal")
                          .doc(userInfo['email'])
                          .set(
                              {'morningReflection': {}, 'nightReflection': {}});
                    }
                    final journal = await _firestore
                        .collection("Journal")
                        .doc(userInfo['email'])
                        .get();
                    print('====================');
                    print(journal['morningReflection']);
                    Map morningReflection = journal['morningReflection'];
                    Map nightReflection = journal['nightReflection'];

                    DateTime journalTime = DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day);

                    if (isMorning) {
                      morningReflection[journalTime.toString()] = [
                        controller1.text,
                        controller2.text,
                        controller3.text
                      ];

                      _firestore
                          .collection("Journal")
                          .doc(userInfo['email'])
                          .update({'morningReflection': morningReflection});
                    } else {
                      nightReflection[journalTime.toString()] = [
                        controller1.text,
                        controller2.text,
                        controller3.text
                      ];

                      _firestore
                          .collection("Journal")
                          .doc(userInfo['email'])
                          .update({
                        'nightReflection': nightReflection,
                      });
                    }
                    controller1.clear();
                    controller2.clear();
                    controller3.clear();
                  } else {
                    VxToast.show(context, msg: 'Field is Empty');
                  }
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
