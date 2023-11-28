import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/favoritecontroller.dart';
import 'package:ecommerce/controller/home/itemsscreencontroller.dart';
import 'package:ecommerce/controller/rating/ratingcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:ecommerce/view/screen/home/ratingitems.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CustomListItems extends GetView<ItemsScreenControllerIm> {
  final ItemsModel itemsModel;

  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    int? itemspricediscountceil;
    itemspricediscountceil = itemsModel.itemspricediscount!.ceil();
    Get.put(ItemsScreenControllerIm());
    return InkWell(
        onTap: () {
          controller.goToProudctDetails(itemsModel);
        },
        child: Stack(
          children: [
            Card(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: '${itemsModel.itemsId}',
                    child: CachedNetworkImage(
                      imageUrl:
                          '${LinkApi.imageitems}/${itemsModel.itemsImage}',
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    translateDatabase(
                        "${itemsModel.itemsNameAr}", "${itemsModel.itemsName}"),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                        fontSize: 16),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating ${itemsModel.itemsRating}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.gray, height: 2),
                      ),
                      GetBuilder<RatingController>(builder: (controller) {
                        return Container(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () async {
                                await showDialogRatingItems(
                                    context, itemsModel.itemsId.toString());
                              },
                              child: const Text(
                                'Rating',
                                style: TextStyle(
                                  height: 2,
                                  color: AppColor.primarycolor,
                                ),
                                textAlign: TextAlign.center,
                              )),
                        );
                      })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemspricediscountceil} \$",
                        style: const TextStyle(
                            color: AppColor.primarycolor,
                            fontSize: 16,
                            fontFamily: 'sans',
                            fontWeight: FontWeight.bold),
                      ),
                      GetBuilder<FavoriteController>(
                          builder: (controller) => IconButton(
                              onPressed: () {
                                if (controller.isFavorite[itemsModel.itemsId] ==
                                    '1') {
                                  controller.setFavorite(
                                      itemsModel.itemsId, '0');
                                  controller.deleteFavorite(
                                      itemsModel.itemsId.toString());
                                } else {
                                  controller.setFavorite(
                                      itemsModel.itemsId, '1');
                                  controller.addFavorite(
                                      itemsModel.itemsId.toString());
                                }
                              },
                              icon: Icon(
                                controller.isFavorite[itemsModel.itemsId] == '1'
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: AppColor.primarycolor,
                              )))
                    ],
                  )
                ],
              ),
            )),
            itemsModel.itemsDiscount != 0
                ? Positioned(
                    left: 5,
                    top: 5,
                    child: Image.asset(
                      fit: BoxFit.fill,
                      AppImageAsset.sales,
                      height: 40,
                      width: 40,
                    ),
                  )
                : Container()
          ],
        ));
  }
}
