import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items/favoritedata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        itemsid, myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: 'إشعار', messageText: Text('تم إضافة المنتج الي المفضلة'));
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  deleteFavorite(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavorite(
        itemsid, myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: 'إشعار', messageText: Text('تم حذف المنتج من المفضلة'));
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }
}
