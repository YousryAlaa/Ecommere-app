import 'package:ecommerce/controller/home/homepagecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerIm> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class Categories extends GetView<HomeControllerIm> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(20)),
            child: Image.network(
              "${LinkApi.imagecategories}/${categoriesModel.categoriesImage}",
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              translateDatabase("${categoriesModel.categoriesNameAr}",
                  "${categoriesModel.categoriesName}"),
              style: const TextStyle(color: AppColor.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
