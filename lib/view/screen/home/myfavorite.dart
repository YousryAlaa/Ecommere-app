import 'package:ecommerce/controller/home/myfavoriteviewcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistitemsmyfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFovrite extends StatelessWidget {
  const MyFovrite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
        body: GetBuilder<MyFavoriteController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            // CustomAppBar(
            //   hinttext: 'Find Product',
            //   onPressedIcon: () {},
            //   onPressed: () {},
            //   onPressedMyFavorie: () {
            //     Get.toNamed(AppRoutes.myfavorite);
            //   },
            // ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    itemCount: controller.data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (context, i) {
                      return CustomListItemsMyFavorite(
                          itemsModel: controller.data[i]);
                    }))
          ],
        ),
      ),
    ));
  }
}
