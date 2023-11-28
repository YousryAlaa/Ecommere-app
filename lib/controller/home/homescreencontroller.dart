import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/screen/home/home.dart';
import 'package:ecommerce/view/screen/home/settings.dart';
import 'package:ecommerce/view/screen/notification.dart';
import 'package:ecommerce/view/screen/offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  goToShoppingCart();
}

class HomeScreenControllerIm extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    HomePage(),
    Settings(),
    OffersView(),
    NotifictionView()
  ];
  List<String> listName = [
    "CustomBottombar1".tr,
    "CustomBottombar2".tr,
    "Offers",
    'Notify'
  ];
  List<IconData> listIcon = [
    Icons.home,
    Icons.settings,
    Icons.discount_outlined,
    Icons.notifications_active_outlined
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  @override
  goToShoppingCart() {
    Get.toNamed(AppRoutes.shoppingcart);
  }
}
