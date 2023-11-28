import 'package:ecommerce/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(String columnar, String columnen) {
  MyServices myServices = Get.find();
  if (myServices.sharedpref.getString('lang') == 'ar') {
    return columnar;
  } else {
    return columnen;
  }
}
