import 'package:ecommerce/controller/home/itemsscreencontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCategoriesItemsHome extends GetView<ItemsScreenControllerIm> {
  const ListCategoriesItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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

class Categories extends GetView<ItemsScreenControllerIm> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSelectCat(i!, categoriesModel.categoriesId.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsScreenControllerIm>(
            builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: controller.selectedCat == i
                  ? const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                      width: 3,
                      color: AppColor.primarycolor,
                    )))
                  : null,
              child: Text(
                translateDatabase("${categoriesModel.categoriesNameAr}",
                    "${categoriesModel.categoriesName}"),
                style: const TextStyle(color: AppColor.grey2, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
