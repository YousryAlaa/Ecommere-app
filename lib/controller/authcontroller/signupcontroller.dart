import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
}

class SignUpControllerIm extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;

  late TextEditingController phone;

  late TextEditingController password;
  bool ishowpass = true;
  StatusRequest statusRequest = StatusRequest.none;
  SignupData signupData = SignupData(Get.find());

  showOrHidePass() {
    ishowpass = ishowpass == true ? false : true;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToLogin() {
    Get.offNamed("/login");
  }

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verifycodesignup,
              arguments: {'email': email.text});

          // data.addAll(response['data']);
        } else {
          Get.defaultDialog(
              title: "SignupDialogTit".tr, middleText: "SignupDialogBody".tr);
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }
}
