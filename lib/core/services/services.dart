import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedpref;
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    sharedpref = await SharedPreferences.getInstance();
    return this;
  }
}

intialServices() async {
  await Get.putAsync(() => MyServices().init());
}
