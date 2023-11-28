import 'package:ecommerce/controller/home/productdetailscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/view/widget/items/productdetails/bottomnavigationbuttom.dart';
import 'package:ecommerce/view/widget/items/productdetails/listgeneratecolors.dart';
import 'package:ecommerce/view/widget/items/productdetails/stackofproductimage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerIm controller =
        Get.put(ProductDetailsControllerIm());

    return Scaffold(
        bottomNavigationBar: const BottomNavigButton(),
        body: GetBuilder<ProductDetailsControllerIm>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    child: ListView(children: [
                      const StackOfProductImage(),
                      const SizedBox(height: 100),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translateDatabase(
                                "${controller.itemsModel.itemsNameAr}",
                                "${controller.itemsModel.itemsName}",
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: AppColor.fourthcolor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      controller.deleteItemsCart();
                                    },
                                    icon: Icon(Icons.remove)),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  alignment: Alignment.center,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.fourthcolor)),
                                  child: Text(
                                    '${controller.countitems}',
                                    style: TextStyle(fontSize: 25, height: 1.1),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.addItemsCart();
                                    },
                                    icon: Icon(Icons.add)),
                                const Spacer(),
                                Column(
                                  children: [
                                    Text(
                                      '${controller.itemsModel.itemsPrice} \$',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColor.secondcolor,
                                          fontSize: 20,
                                          height: 1.1),
                                    ),
                                    Text(
                                      '${controller.printCeil(controller.itemsModel.itemspricediscount!)} \$',
                                      style: TextStyle(
                                          color: AppColor.secondcolor,
                                          fontSize: 20,
                                          height: 1.1),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Text(translateDatabase(
                                "${controller.itemsModel.itemsDescAr} ${controller.itemsModel.itemsDescAr} ${controller.itemsModel.itemsDescAr} ${controller.itemsModel.itemsDescAr}",
                                "${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc} ${controller.itemsModel.itemsDesc}")),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Color".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(color: AppColor.fourthcolor),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const ListGenerateColors()
                          ],
                        ),
                      )
                    ]),
                  ),
                )));
  }
}
