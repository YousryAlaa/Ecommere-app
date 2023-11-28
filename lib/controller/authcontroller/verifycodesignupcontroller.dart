import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/verifycodesignupdata.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUPController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verificationCode);
  resendVerifyCode() {}
}

class VerifyCodeSignUpControllerIm extends VerifyCodeSignUPController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignupData verifyCodeSignupData = VerifyCodeSignupData(Get.find());
  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignupData.postData(email!, verificationCode);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.successsignup);

        // data.addAll(response['data']);
      } else {
        Get.defaultDialog(
            title: "SignupDialogTit".tr, middleText: "SignupDialogBody".tr);
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  resendVerifyCode() async {
    var response = await verifyCodeSignupData.resendData(email!);

    // if (response['status'] == "success") {
    //   Get.offAllNamed(AppRoutes.successsignup);
    // } else {
    //   Get.defaultDialog(
    //       title: "SignupDialogTit".tr, middleText: "SignupDialogBody".tr);
    // }
  }
}
