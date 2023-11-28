import 'package:get/get.dart';

validInput(String val, int max, int min, String type) {
  if (type == 'username') {
    if (!GetUtils.isUsername(val)) {
      return "ValidInputUsername".tr;
    }
  }
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "ValidInputEmail".tr;
    }
  }
  if (type == 'phone') {
    if (!GetUtils.isPhoneNumber(val)) {
      return "ValidInputPhone".tr;
    }
  }
  if (val.isEmpty) {
    return "ValidInputEmpty".tr;
  }
  if (val.length < min) {
    return "ValidInputMin $min".tr;
  }
  if (val.length > max) {
    return "ValidInputMax $max".tr;
  }
}
