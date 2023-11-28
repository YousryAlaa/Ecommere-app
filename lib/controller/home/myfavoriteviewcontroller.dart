// ignore_for_file: unrelated_type_equality_checks

import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items/myfavoritedata.dart';
import 'package:ecommerce/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteController extends GetxController {
  List<MyFavoriteModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find();

  initalData() {
    getData();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await myFavoriteData.getData(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];

        data.addAll(responsedata.map((e) => MyFavoriteModel.fromJson(e)));
        print("data --------");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteMyFavorite(String favoriteid) {
    var response = myFavoriteData.deleteFavorite(favoriteid);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteid);
    update();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }
}
