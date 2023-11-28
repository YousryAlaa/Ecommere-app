import 'package:ecommerce/controller/home/favoritecontroller.dart';
import 'package:ecommerce/controller/offerscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistsearchitems.dart';
import 'package:ecommerce/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    Get.put(FavoriteController());
    return GetBuilder<OffersController>(
        builder: ((controller) => Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                      searchcontroller: controller.searchcontroller,
                      onPressedIcon: () {
                        controller.onSearch();
                      },
                      hinttext: 'CutsomSearchAppbar'.tr,
                      onPressedMyFavorie: () {
                        Get.toNamed(AppRoutes.myfavorite);
                      },
                      onMyChanged: (val) {
                        controller.checkSearch(val);
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: controller.issearch == false
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.data.length,
                              itemBuilder: (context, index) {
                                return CustomListItemsOffers(
                                    itemsModel: controller.data[index]);
                              })
                          : ListView.builder(
                              itemCount: controller.searchlist.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomListSearchItems(
                                  itemsModel: controller.searchlist[index],
                                );
                              }))
                ],
              ),
            )));
  }
}
