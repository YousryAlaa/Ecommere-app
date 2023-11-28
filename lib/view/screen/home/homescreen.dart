import 'dart:io';

import 'package:ecommerce/controller/home/homescreencontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/home/customlistbottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerIm());
    return GetBuilder<HomeScreenControllerIm>(builder: (controller) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.goToShoppingCart();
            },
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: const CustomListBottonNavigation(),
          body: WillPopScope(
              child: controller.listPage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "Warning",
                  titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primarycolor),
                  middleText: "Do You Want To Exit The App",
                  cancelTextColor: AppColor.secondcolor,
                  confirmTextColor: AppColor.secondcolor,
                  buttonColor: AppColor.color2,
                  onCancel: () {},
                  onConfirm: () {
                    exit(0);
                  },
                );
                return Future.value(false);
              }));
    });
  }
}
