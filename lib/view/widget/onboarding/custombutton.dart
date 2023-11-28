import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerIm> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 100),
        textColor: Colors.white,
        color: AppColor.primarycolor,
        child: Text('OnBoardBtn'.tr),
      ),
    );
  }
}
