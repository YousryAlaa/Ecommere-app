import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "AlertExitAppTit".tr,
      content: Text("AlertExitAppCont".tr),
      actions: [
        ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("AlertExitAppBtn2".tr)),
        ElevatedButton(
            onPressed: () {
              exit(0);
            },
            child: Text("AlertExitAppBtn1".tr))
      ]);
  return Future.value(true);
}
