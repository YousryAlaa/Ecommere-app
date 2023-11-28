import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/auth/logindata.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerIm extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowpass = true;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  showOrHidePass() {
    isshowpass = isshowpass == true ? false : true;
    update();
  }

  @override
  goToSignUp() {
    Get.offNamed("/signup");
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.loginData(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      update();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedpref
                .setString('id', response['data']['users_id'].toString());
            String userid = myServices.sharedpref.getString('id')!;
            myServices.sharedpref
                .setString('username', response['data']['users_name']);
            myServices.sharedpref
                .setString('email', response['data']['users_email']);
            myServices.sharedpref
                .setString('phone', response['data']['users_phone']);

            myServices.sharedpref.setString('step', '2');

            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic("users$userid");

            Get.offNamed(AppRoutes.homepage);
          } else {
            Get.offNamed(AppRoutes.verifycodesignup,
                arguments: {'email': email.text});
          }
        } else if (response['status'] == "failure") {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct");
        }
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed("/forgetpassword");
  }
}
