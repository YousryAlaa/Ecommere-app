import 'package:ecommerce/bindigns.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/core/localization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    LoacalControlller controller = Get.put(LoacalControlller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: controller.appTheme,
      translations: MyTranslation(),
      locale: controller.language,
      getPages: routes,
      initialBinding: IntiialBindigns(),
    );
  }
}
