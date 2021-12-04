import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AllMissions extends StatelessWidget {
  AllMissions({Key? key}) : super(key: key);
  final getStorage = GetStorage();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addData() async {
    final sessionData = await getStorage.read('userInfo');
    String userEmail = sessionData['email'];
    print(userEmail);
    // _firestore.collection('Missions').doc(userEmail).set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: TextButton(
                onPressed: () {
                  addData();
                },
                child: Text('Add data'))),
      ),
    );
  }
}
