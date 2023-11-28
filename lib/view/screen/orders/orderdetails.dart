import 'package:ecommerce/controller/order/orderdetailscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: GetBuilder<OrderDetailsController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView(
                      children: [
                        Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        'Item',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            height: 4,
                                            color: AppColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('QTY',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 4,
                                              color: AppColor.primarycolor,
                                              fontWeight: FontWeight.bold)),
                                      Text('Price',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              height: 4,
                                              color: AppColor.primarycolor,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(children: [
                                        Text(
                                          '${controller.data[index].itemsName}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${controller.data[index].countitems}',
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          '${controller.priceCeil(controller.data[index].cartsItemsprice!)} \$',
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Total Price : ${controller.myOrderModel!.orderTotalprice} \$',
                                  style: const TextStyle(
                                      color: AppColor.primarycolor,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (controller.myOrderModel!.orderType ==
                            int.parse("0"))
                          Container(
                              child: Card(
                            child: ListTile(
                              title: const Text(
                                'Shipping Address',
                                style: TextStyle(color: AppColor.primarycolor),
                              ),
                              subtitle: Text(
                                  "${controller.myOrderModel!.addressCity} ${controller.myOrderModel!.addressStreet}"),
                            ),
                          ))
                      ],
                    ),
                  ),
                )));
  }
}
