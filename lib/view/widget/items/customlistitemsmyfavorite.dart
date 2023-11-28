import 'package:cached_network_image/cached_network_image.dart';

import 'package:ecommerce/controller/home/myfavoriteviewcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsMyFavorite extends GetView<MyFavoriteController> {
  final MyFavoriteModel itemsModel;

  const CustomListItemsMyFavorite({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    MyFavoriteController controller = Get.put(MyFavoriteController());
    return InkWell(
      onTap: () {
        // controller.goToProudctDetails(itemsModel);
      },
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: '${itemsModel.itemsId}',
              child: CachedNetworkImage(
                imageUrl: '${LinkApi.imageitems}/${itemsModel.itemsImage}',
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
                const Text(
                  'Rating 3.5',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColor.gray, height: 2),
                ),
                Container(
                  height: 22,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 14,
                              ))
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${itemsModel.itemsPrice} \$",
                    style: const TextStyle(
                        color: AppColor.primarycolor,
                        fontSize: 16,
                        fontFamily: 'sans',
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        controller
                            .deleteMyFavorite(itemsModel.favoriteId.toString());
                      },
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColor.primarycolor,
                      ))
                  //   GetBuilder<FavoriteController>(
                  //       builder: (controller) => IconButton(
                  //           onPressed: () {
                  //             if (controller.isFavorite[itemsModel.itemsId] ==
                  //                 '1') {
                  //               controller.setFavorite(itemsModel.itemsId, '0');
                  //               controller
                  //                   .deleteFavorite(itemsModel.itemsId.toString());
                  //             } else {
                  //               controller.setFavorite(itemsModel.itemsId, '1');
                  //               controller
                  //                   .addFavorite(itemsModel.itemsId.toString());
                  //             }
                  //           },
                  //           icon: Icon(
                  //             controller.isFavorite[itemsModel.itemsId] == '1'
                  //                 ? Icons.favorite
                  //                 : Icons.favorite_border_outlined,
                  //             color: AppColor.primarycolor,
                  //           )))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
