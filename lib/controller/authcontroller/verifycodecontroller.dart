import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodedata.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verificationCode);
}

class VerifyCodeControllerIm extends VerifyCodeController {
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  String? email;
  @override
  checkCode() {}
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToResetPassword(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await verifyCodeData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed("/resetpassword", arguments: {'email': email});
        // data.addAll(response['data']);
      } else {
        Get.defaultDialog(
            title: "SignupDialogTit".tr, middleText: "SignupDialogBody".tr);
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
