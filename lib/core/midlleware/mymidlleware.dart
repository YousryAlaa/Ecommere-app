import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMidlleware extends GetMiddleware {
  MyServices myservises = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myservises.sharedpref.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homepage);
    }
    if (myservises.sharedpref.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
