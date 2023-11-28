import 'package:ecommerce/controller/address/viewaddresscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressControllerIm());

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.addaddress);
            },
            child: Icon(Icons.add)),
        appBar: AppBar(
          title: const Text('Address'),
        ),
        body: GetBuilder<ViewAddressControllerIm>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView(
                children: [
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) {
                        return Card(
                          child: ListTile(
                            title: Text('${controller.data[i].addressName}'),
                            subtitle: Text(
                                "'${controller.data[i].addressCity}' , '${controller.data[i].addressStreet}'"),
                            trailing: IconButton(
                              onPressed: () async {
                                await controller.deleteAddress(
                                    controller.data[i].addressId.toString());
                              },
                              icon: Icon(Icons.delete_outline),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
