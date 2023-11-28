import 'package:ecommerce/controller/onboardingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerIm> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onboardinglist.length,
        itemBuilder: (context, i) => Column(
              children: [
                Image.asset(onboardinglist[i].image!,
                    height: Get.width / 1.3, fit: BoxFit.fill),
                const SizedBox(
                  height: 70,
                ),
                Text(
                  onboardinglist[i].title!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onboardinglist[i].body!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 2,
                          color: AppColor.gray,
                          fontSize: 16),
                    )),
              ],
            ));
  }
}
