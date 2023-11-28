import 'package:get/get.dart';

abstract class SucessSignUpController extends GetxController {
  goToLogin();
}

class SucessSignUpIm extends SucessSignUpController {
  @override
  goToLogin() {
    Get.offNamed("/login");
  }
}
