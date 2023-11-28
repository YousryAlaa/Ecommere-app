import 'package:ecommerce/controller/home/shoppingcartcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationbarShoppingCart extends StatelessWidget {
  const BottomNavigationbarShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartControllerIm>(
        builder: (controller) => Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  controller.couponname == null
                      ? Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(children: [
                            Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: controller.couponcontroller,
                                  decoration: const InputDecoration(
                                      hintText: 'Coupon code',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8)),
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 35,
                                  color: AppColor.primarycolor,
                                  width: double.infinity,
                                  child: MaterialButton(
                                    textColor: Colors.white,
                                    onPressed: () async {
                                      await controller.checkCoupon();
                                      controller.refreshPage();
                                    },
                                    child: const Text(
                                      'apply',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ))
                          ]),
                        )
                      : Container(
                          child: Text(
                            'Coupon code ${controller.couponname} ',
                            style: const TextStyle(
                                color: AppColor.primarycolor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.primarycolor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$${controller.totalpriceceil}',
                              style: const TextStyle(
                                  color: AppColor.primarycolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Discount',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${controller.discountcoupon}%',
                              style: const TextStyle(
                                  color: AppColor.primarycolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Shipping',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '\$${controller.shipping}',
                              style: const TextStyle(
                                  color: AppColor.primarycolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Total price',
                                style: TextStyle(
                                    color: AppColor.primarycolor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '\$${controller.totalprice3}',
                              style: const TextStyle(
                                  color: AppColor.primarycolor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: MaterialButton(
                      onPressed: () {
                        controller.goToCheckout();
                      },
                      color: AppColor.primarycolor,
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        child: const Center(
                          child: Text(
                            'Order',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
