import 'package:ecommerce/controller/home/homepagecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerIm> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.items.length,
          itemBuilder: (context, i) {
            return Items(itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class Items extends GetView<HomeControllerIm> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProudctDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Image.network(
              "${LinkApi.imageitems}/${itemsModel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.black.withOpacity(0.2)),
            height: 120,
            width: 185,
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Text(
                translateDatabase(
                    "${itemsModel.itemsNameAr}", "${itemsModel.itemsName}"),
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}

class CustomListItemsOffersHome extends GetView<HomeControllerIm> {
  const CustomListItemsOffersHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.itemsoffer.length,
          itemBuilder: (context, i) {
            return Items(
                itemsModel: ItemsModel.fromJson(controller.itemsoffer[i]));
          }),
    );
  }
}

class ItemsOffers extends GetView<HomeControllerIm> {
  final ItemsModel itemsModel;
  const ItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToProudctDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Image.network(
              "${LinkApi.imageitems}/${itemsModel.itemsImage}",
              height: 100,
              width: 150,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.black.withOpacity(0.2)),
            height: 120,
            width: 185,
          ),
          Positioned(
              top: 10,
              left: 10,
              child: Text(
                translateDatabase(
                    "${itemsModel.itemsNameAr}", "${itemsModel.itemsName}"),
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
