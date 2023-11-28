import 'package:ecommerce/controller/checkout/checkoutcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/checkout/customcardaddress.dart';
import 'package:ecommerce/view/widget/checkout/customdeliverymethod.dart';
import 'package:ecommerce/view/widget/checkout/custompaymentmethod.dart';
import 'package:ecommerce/view/widget/checkout/customtitlecheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        bottomNavigationBar: Container(
            height: 40,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(10)),
            child: MaterialButton(
              onPressed: () {
                controller.addData();
              },
              child: const Text(
                'Checkout',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const CustomTitleCheckOut(
                            title: 'Choose Payment Method'),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod('0');
                          },
                          child: CustomPaymentMethod(
                            namepayment: 'Cash On Delivey',
                            isActive:
                                controller.paymentmethod == '0' ? true : false,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            controller.choosePaymentMethod('1');
                          },
                          child: CustomPaymentMethod(
                            isActive:
                                controller.paymentmethod == '1' ? true : false,
                            namepayment: 'Payment Cards',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomTitleCheckOut(title: 'Choose Delivey Type'),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryMethod('0');
                              },
                              child: CustomDeliveyMethod(
                                isActive: controller.paymentdelivery == '0'
                                    ? true
                                    : false,
                                imagename: AppImageAsset.delivery,
                                methodname: 'Delivey',
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryMethod('1');
                              },
                              child: CustomDeliveyMethod(
                                isActive: controller.paymentdelivery == '1'
                                    ? true
                                    : false,
                                imagename: AppImageAsset.cardelivery,
                                methodname: 'Recive',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (controller.paymentdelivery == '0')
                          controller.listaddress.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Shipping Address',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: AppColor.primarycolor),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ...List.generate(
                                      controller.listaddress.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          controller.chooseAddress(controller
                                              .listaddress[index].addressId
                                              .toString());
                                        },
                                        child: CustomCardAddress(
                                          isActive: controller.addressid ==
                                                  controller.listaddress[index]
                                                      .addressId
                                                      .toString()
                                              ? true
                                              : false,
                                          title:
                                              '${controller.listaddress[index].addressName}',
                                          subtitle:
                                              "${controller.listaddress[index].addressCity} , ${controller.listaddress[index].addressStreet}",
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : InkWell(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.addaddress);
                                  },
                                  child: Text(
                                    'Please Add Shipping Address \n Click Here ',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(color: AppColor.primarycolor),
                                  ),
                                )
                      ],
                    ),
                  ),
                )));
  }
}
