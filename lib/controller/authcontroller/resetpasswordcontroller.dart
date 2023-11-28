import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  login();
}

class ResetPasswordControllerIm extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password1;
  late TextEditingController password2;
  bool isshowpass = true;
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  showOrHidePass() {
    isshowpass = isshowpass == true ? false : true;
    update();
  }

  @override
  login() async {
    if (password1.text != password2.text) {
      return Get.defaultDialog(
          title: 'Warning', middleText: " Password Don't Match");
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password1.text);
      statusRequest = handlingData(response);
      update();
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoutes.successresetpassword);
        } else {
          Get.defaultDialog(title: 'Warning', middleText: " Try Again");
        }
      }
    }
  }

  @override
  void onInit() {
    password1 = TextEditingController();
    password2 = TextEditingController();
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  void dispose() {
    password1.dispose();
    password2.dispose();
    super.dispose();
  }
}
