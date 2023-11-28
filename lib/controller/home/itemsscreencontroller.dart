import 'package:ecommerce/controller/home/homepagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/items/itemsdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsScreenController extends MixSearchController {
  initalData();
  changeSelectCat(int val, String catval);
  getItems(String categoryid);
  goToProudctDetails(ItemsModel itemsModel);
}

class ItemsScreenControllerIm extends ItemsScreenController {
  List categories = [];
  List data = [];
  int? selectedCat;
  String? catid;
  String? categoryid;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  initalData() {
    searchcontroller = TextEditingController();

    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    categoryid = Get.arguments['categoryid'];

    getItems(categoryid!);
  }

  @override
  changeSelectCat(val, catval) {
    selectedCat = val;
    catid = catval;
    getItems(catid!);
    update();
  }

  @override
  getItems(categoryid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.getData(
        categoryid, myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        data.addAll(response['data']);
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProudctDetails(itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {'itemsmodel': itemsModel});
  }
}
