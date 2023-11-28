import 'package:ecommerce/controller/home/favoritecontroller.dart';
import 'package:ecommerce/controller/home/itemsscreencontroller.dart';
import 'package:ecommerce/controller/rating/ratingcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/items/customlistitems.dart';
import 'package:ecommerce/view/widget/items/customlistsearchitems.dart';
import 'package:ecommerce/view/widget/items/listcategoriesitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsScreenControllerIm controller = Get.put(ItemsScreenControllerIm());
    FavoriteController controllerFavo = Get.put(FavoriteController());
    RatingController controllerRate = Get.put(RatingController());

    return Scaffold(
        body: GetBuilder<ItemsScreenControllerIm>(
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              onMyChanged: (val) {
                controller.checkSearch(val);
              },
              searchcontroller: controller.searchcontroller,
              hinttext: 'Find Product',
              onPressedIcon: () {
                controller.onSearch();
              },
              onPressedMyFavorie: () {
                Get.toNamed(AppRoutes.myfavorite);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const ListCategoriesItemsHome(),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.issearch == false
                    ? GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.6),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          controllerFavo.isFavorite[controller.data[index]
                                  ['items_id']] =
                              controller.data[index]['favorite'];
                          return CustomListItems(
                              itemsModel:
                                  ItemsModel.fromJson(controller.data[index]));
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
      ),
    ));
  }
}
