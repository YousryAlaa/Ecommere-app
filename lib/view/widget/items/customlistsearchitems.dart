import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListSearchItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListSearchItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productdetails,
            arguments: {'itemsmodel': itemsModel});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Card(
            child: Row(
          children: [
            Expanded(
                flex: 1,
                child: CachedNetworkImage(
                  imageUrl: '${LinkApi.imageitems}/${itemsModel.itemsImage}',
                  fit: BoxFit.fill,
                  height: 80,
                )),
            Expanded(
                flex: 2,
                child: ListTile(
                  title: Text('${itemsModel.itemsName}'),
                  subtitle: Text('${itemsModel.categoriesName}'),
                ))
          ],
        )),
      ),
    );
  }
}
