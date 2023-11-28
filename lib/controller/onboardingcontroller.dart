import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerIm extends OnBoardingController {
  MyServices myservices = Get.find();
  int currentpage = 0;
  late PageController pagecontroller;
  @override
  next() {
    currentpage++;
    if (currentpage == onboardinglist.length) {
      myservices.sharedpref.setString("step", "1");
      Get.offAllNamed("/login");
    } else {
      pagecontroller.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    pagecontroller = PageController();
    super.onInit();
  }

  @override
  onPageChanged(int index) {
    currentpage = index;
    update();
  }
}
