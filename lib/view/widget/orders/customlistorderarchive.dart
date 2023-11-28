import 'package:ecommerce/controller/order/archiveordercontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/myordermodel.dart';
import 'package:ecommerce/view/screen/orders/rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CustomArchiveOrder extends GetView<ArchiveOrderController> {
  final MyOrderModel myOrderModel;
  const CustomArchiveOrder({super.key, required this.myOrderModel});

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
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy('${myOrderModel.orderDatetime}', 'yyyy-MM-dd')
                      .fromNow(),
                  style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Divider(),
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
                  style: const TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.orderdetails,
                          arguments: {'orderdetails': myOrderModel});
                    },
                    color: AppColor.color2,
                    textColor: AppColor.secondcolor,
                    child: const Text('Details')),
                SizedBox(
                  width: 5,
                ),
                if (myOrderModel.orderRating == 0)
                  MaterialButton(
                      onPressed: () {
                        showDialogRating(
                            context, myOrderModel.orderId.toString());
                      },
                      color: AppColor.color2,
                      textColor: AppColor.secondcolor,
                      child: const Text('Rating'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
