import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    String usersid = myServices.sharedpref.getString('id')!;

    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$usersid");

    myServices.sharedpref.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
