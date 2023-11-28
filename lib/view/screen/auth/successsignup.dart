import 'package:ecommerce/controller/authcontroller/successsignupcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SucessSignUpIm controller = Get.put(SucessSignUpIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "SuccessSignupTit".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primarycolor,
            ),
            Text(
              textAlign: TextAlign.center,
              "SuccessSignUpBod".tr,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                onPressed: () {
                  controller.goToLogin();
                },
                text: "SuccessSignUpBtn".tr,
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ]),
        ));
  }
}
