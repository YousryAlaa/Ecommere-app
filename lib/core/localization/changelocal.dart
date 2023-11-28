import 'package:ecommerce/core/constant/themedata.dart';
import 'package:ecommerce/core/function/fcmconfig.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoacalControlller extends GetxController {
  Locale? language;
  ThemeData appTheme = themeEnglish;

  MyServices myServices = Get.find();
  void changeLang(String langcode) {
    Locale local = Locale(langcode);
    myServices.sharedpref.setString('lang', langcode);
    appTheme = langcode == "en" ? themeEnglish : themeArabic;
    Get.changeTheme(appTheme);
    Get.updateLocale(local);
  }

  @override
  void onInit() {
    requsetPermissionNotification();
    fcmconfig();
    String? sharedPrefLang = myServices.sharedpref.getString("lang");
    if (sharedPrefLang == 'ar') {
      language = const Locale('ar');
      appTheme = themeArabic;
    } else if (sharedPrefLang == 'en') {
      language = const Locale('en');
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
