import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StackOfProductImage extends GetView<ProductDetailsControllerIm> {
  const StackOfProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.secondcolor,
          ),
        ),
        Positioned(
          top: 40,
          left: Get.width / 8,
          right: Get.width / 8,
          child: Hero(
            tag: '${controller.itemsModel.itemsId}',
            child: CachedNetworkImage(
              imageUrl:
                  "${LinkApi.imageitems}/${controller.itemsModel.itemsImage}",
              height: 250,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
