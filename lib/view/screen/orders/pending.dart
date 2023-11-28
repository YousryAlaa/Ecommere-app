import 'package:ecommerce/controller/order/pendingordercontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/myordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingOrders extends StatelessWidget {
  const PendingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingOrderController());

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
        ),
        body: GetBuilder<PendingOrderController>(
            builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return CustomPendingOrder(
                            myOrderModel: controller.data[index]);
                      },
                    ),
                  ),
                ))));
  }
}

class CustomPendingOrder extends GetView<PendingOrderController> {
  final MyOrderModel myOrderModel;
  const CustomPendingOrder({super.key, required this.myOrderModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Number : #${myOrderModel.orderId}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy('${myOrderModel.orderDatetime}', 'yyyy-MM-dd')
                      .fromNow(),
                  style: TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(),
            Text(
                'Order Type : ${controller.printOrderType(myOrderModel.orderType.toString())}'),
            Text('Order Price : ${myOrderModel.orderPrice} \$'),
            Text('Delivery Price : ${myOrderModel.orderPricedelivery} \$'),
            Text(
                'Payment Method : ${controller.printPaymentMethod(myOrderModel.orderPaymentmehod.toString())}'),
            Text(
                'Order Status : ${controller.printOrderStatus(myOrderModel.orderStatus.toString())}'),
            Divider(),
            Row(
              children: [
                Text(
                  'Total Price : ${myOrderModel.orderTotalprice} \$',
                  style: TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                if (myOrderModel.orderStatus == 0)
                  MaterialButton(
                    onPressed: () {
                      controller.deleteOrder(myOrderModel.orderId.toString());
                    },
                    child: Text('Delete'),
                    color: AppColor.color2,
                    textColor: AppColor.secondcolor,
                  ),
                SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.orderdetails,
                        arguments: {'orderdetails': myOrderModel});
                  },
                  child: Text('Details'),
                  color: AppColor.color2,
                  textColor: AppColor.secondcolor,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
