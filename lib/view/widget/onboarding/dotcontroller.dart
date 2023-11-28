import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerIm>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onboardinglist.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          height: 6,
                          width: controller.currentpage == index ? 20 : 6,
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            ));
  }
}
