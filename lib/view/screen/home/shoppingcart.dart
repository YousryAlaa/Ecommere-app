import 'package:ecommerce/controller/home/shoppingcartcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/customlistitemsmycart.dart';
import 'package:ecommerce/view/widget/shoppingcart/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCartControllerIm controller = Get.put(ShoppingCartControllerIm());

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.primarycolor,
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share_outlined,
                color: AppColor.primarycolor,
              )),
        ],
      ),
      body: GetBuilder<ShoppingCartControllerIm>(
          builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('Shopping Cart',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: AppColor.primarycolor,
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22)),
                        subtitle: Text(
                          '${controller.totalcountitems} items',
                          style: TextStyle(fontSize: 18, height: 1.7),
                        ),
                        trailing: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 34),
                            child: Text('Edit',
                                style: TextStyle(fontSize: 18, height: 1.5)),
                          ),
                        ),
                      ),
                      Divider(
                        color: AppColor.primarycolor,
                        thickness: 3,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return CustomListItemsMyCart(
                              myCartModel: controller.data[i],
                            );
                          },
                          itemCount: controller.data.length),
                    ],
                  ),
                ),
              )),
      bottomNavigationBar: BottomNavigationbarShoppingCart(),
    );
  }
}
