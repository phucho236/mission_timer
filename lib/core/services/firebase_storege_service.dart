import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mission_timer/firebase_options.dart';

class FirebaseStorageService extends GetxService {
  @override
  void onInit() {
    // init();
    super.onInit();
  }

  void init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<String> putPhoto(File file) async {
    final storage = FirebaseStorage.instance;
    var snapshot = await storage.ref().child(file.path).putFile(file);
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }
}
