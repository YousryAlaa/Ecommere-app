import 'package:ecommerce/controller/order/archiveordercontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/view/widget/orders/customlistorderarchive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchiveOrders extends StatelessWidget {
  const ArchiveOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrderController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('Archive'),
        ),
        body: GetBuilder<ArchiveOrderController>(
            builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CustomArchiveOrder(
                            myOrderModel: controller.data[index]);
                      },
                    ),
                  ),
                ))));
  }
}
