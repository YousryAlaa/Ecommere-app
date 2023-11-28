import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/forgetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkCode();
  goToVerifyCode();
}

class ForgetPasswordControllerIm extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;
  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  checkCode() {}

  @override
  goToVerifyCode() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.postData(email.text);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.toNamed("/verifycode", arguments: {'email': email.text});
        } else {
          Get.defaultDialog(
            title: 'Warning',
            middleText: 'Email Not Correct',
          );
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }
}
