import 'package:ecommerce/controller/home/homepagecontroller.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/offersdata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OffersController extends MixSearchController {
  StatusRequest statusRequest = StatusRequest.none;
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];

  goToProudctDetails(itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {'itemsmodel': itemsModel});
  }

  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    searchcontroller = TextEditingController();
    getOffers();
    super.onInit();
  }
}
