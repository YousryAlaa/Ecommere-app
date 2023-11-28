import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce/view/widget/onboarding/customslider.dart';
import 'package:ecommerce/view/widget/onboarding/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerIm());
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const Expanded(flex: 9, child: CustomSlider()),
              Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    CustomDotController(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
