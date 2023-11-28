import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items/cartdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  addCart(String itemsid, String itemsprice);
  addItemsCart();
  deleteCart(String itemsid);
  deleteItemsCart();
  getItmesCartCount(String itemsid);
  goToCart();
}

class ProductDetailsControllerIm extends ProductDetailsController {
  late StatusRequest statusRequest;
  late ItemsModel itemsModel;
  int countitems = 0;
  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  int printCeil(double discountprice) {
    return discountprice.ceil();
  }

  List colors = [
    {'color': 'Red', 'id': 0, 'active': '1'},
    {'color': 'Black', 'id': 1, 'active': '0'},
    {'color': 'Blue', 'id': 2, 'active': '0'}
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getItmesCartCount(itemsModel.itemsId!.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  addCart(String itemsid, String itemsprice) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemsid, myServices.sharedpref.getString('id')!, itemsprice);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'إشعار', messageText: Text('تم إضافة المنتج الي السلة'));
        update();
      }
    }
  }

  @override
  addItemsCart() {
    addCart(itemsModel.itemsId.toString(),
        itemsModel.itemspricediscount.toString());
    countitems++;

    update();
  }

  @override
  deleteCart(String itemsid) async {
    var response = await cartData.deleteCart(
        itemsid, myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(
            title: 'إشعار', messageText: Text('تم حذف المنتج من السلة'));
        update();
      }
    }
  }

  @override
  deleteItemsCart() {
    if (countitems > 0) {
      deleteCart(itemsModel.itemsId.toString());
      countitems--;

      update();
    }
  }

  @override
  getItmesCartCount(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getItemsCartCount(
        itemsid, myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        countitems = 0;
        countitems = int.parse(response['data']);
        print('---------------------------');
        print('count is $countitems');
        return countitems;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  goToCart() {
    Get.toNamed(
      AppRoutes.shoppingcart,
    );
  }
}
