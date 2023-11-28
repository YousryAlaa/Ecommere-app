import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/home/shoppingcartcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/data/model/mycartmodel.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsMyCart extends StatelessWidget {
  final MyCartModel myCartModel;
  const CustomListItemsMyCart({super.key, required this.myCartModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCartControllerIm>(
        builder: (controller) => Card(
                child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CachedNetworkImage(
                    imageUrl: '${LinkApi.imageitems}/${myCartModel.itemsImage}',
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: ListTile(
                      title: Text(
                        '${myCartModel.itemsName}',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '\$${controller.itemsPriceCiel(myCartModel.itemsprice!)}',
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.primarycolor,
                            height: 2),
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            await controller.addCart(
                                myCartModel.itemsId.toString(),
                                myCartModel.itemsprice.toString());
                            controller.refreshPage();
                          },
                          icon: Icon(Icons.add)),
                      Text(
                        '${myCartModel.countitems}',
                        style: TextStyle(fontFamily: 'sans'),
                      ),
                      IconButton(
                          onPressed: () async {
                            await controller
                                .deleteCart(myCartModel.itemsId.toString());
                            controller.refreshPage();
                          },
                          icon: Icon(Icons.remove))
                    ],
                  ),
                )
              ],
            )
                // title: Text('${myCartModel.itemsName}'),
                // subtitle: Text('${myCartModel.itemsDesc}'),
                ));
  }
}
