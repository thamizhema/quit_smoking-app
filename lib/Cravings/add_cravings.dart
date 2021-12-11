import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quit_smoking/Common/colors.dart';
import 'package:quit_smoking/Common/textfield.dart';
import 'package:quit_smoking/Cravings/craving_details.dart';
import 'package:quit_smoking/Cravings/craving_info.dart';
import 'package:quit_smoking/Cravings/cravings_location.dart';
import 'package:quit_smoking/Cravings/cravings_slider.dart';
import 'package:quit_smoking/qc_getx_controller/all_info_controller.dart';
import 'package:quit_smoking/qc_getx_controller/cravings_controller.dart';

import 'package:velocity_x/velocity_x.dart';

class AddCravings extends StatelessWidget {
  AddCravings({Key? key}) : super(key: key);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final getStorage = GetStorage();
  final CravingsController _cravingsController = Get.find<CravingsController>();
  final AllInfoController _allInfoController = Get.find<AllInfoController>();
  final TextEditingController _comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget hr = const SizedBox(
      height: 20,
      child: Divider(
        thickness: 2,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Cravings'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CravingsSlider(),
                hr,
                CravingLocation(),
                hr,
                CravingsInfo(
                  options: feeling,
                  title: 'How are you felling?',
                  setOptionElement: _cravingsController.feeling,
                ),
                hr,
                CravingsInfo(
                  options: doing,
                  title: 'What are you doing?',
                  setOptionElement: _cravingsController.doing,
                ),
                hr,
                CravingsInfo(
                  options: whoWithYou,
                  title: 'Who are you with?',
                  setOptionElement: _cravingsController.whoWithYou,
                ),
                hr,
                CustomTextField(
                  controller: _comment,
                  hasIcon: false,
                  hintText: 'Add Comment',
                  label: '',
                ),
                const SizedBox(
                  height: 10,
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
                        final userInfo = await getStorage.read('userInfo');

                        Map cravingsData = {
                          'howStrong': int.parse(_cravingsController
                              .cravingStrong.value
                              .toStringAsFixed(0)),
                          'feeling': _cravingsController.feeling.value,
                          'doing': _cravingsController.doing.value,
                          'whoWithYou': _cravingsController.whoWithYou.value,
                          'comment': _comment.text,
                          'day': _allInfoController.totalDays.value
                        };
                        _cravingsController.cravingsList.value
                            .add(cravingsData);
                        List cravingsDataList =
                            _cravingsController.cravingsList.value;
                        print(cravingsDataList);
                        print(cravingsDataList.runtimeType);
                        _firestore
                            .collection('Cravings')
                            .doc(userInfo['email'])
                            .set({
                          'cravings': cravingsDataList,
                        });
                        getStorage.write('cravings', cravingsDataList);
                        Get.back();
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
