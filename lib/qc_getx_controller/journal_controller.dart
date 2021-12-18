import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JournalController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final getStorage = GetStorage();
  final allJournal = {}.obs;

  getAllJournal() async {
    final userinfo = await getStorage.read('userInfo');
    Map journal = await getStorage.read('journal') ?? {};

    String userEmail = userinfo['email'];
    final getAllJournal =
        await _firestore.collection('Journal').doc(userEmail).get();
    getStorage.write('journal', getAllJournal.data());
    journal = await getStorage.read('journal') ?? {};

    allJournal(journal);
    // allJournal(getAllJournal.data());
    print(allJournal);
  }
}
