import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/custombuttonlang/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LoacalControlller> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonLanguage(
                text: "2".tr,
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed("/onboarding");
                }),
            CustomButtonLanguage(
                text: "3".tr,
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed("/onboarding");
                }),
          ],
        ),
      ),
    );
  }
}
