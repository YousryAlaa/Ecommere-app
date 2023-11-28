import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  login();
}

class SuccessResetPasswordIm extends SuccessResetPasswordController {
  @override
  login() {
    Get.offNamed("/login");
  }
}
