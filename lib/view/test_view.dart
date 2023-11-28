import 'package:ecommerce/controller/test_controller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
        appBar: AppBar(title: Text('Test view')),
        body: GetBuilder<TestController>(builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) => Text('${controller.data}')));
        }));
  }
}
