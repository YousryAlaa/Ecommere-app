import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/rating/ratingdata.dart';
import 'package:ecommerce/data/model/ratemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RatingController extends GetxController {
  RatingData ratingData = RatingData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<RateModel> data = [];

  addRating(String itemsid, String rating, String comment) async {
    statusRequest = StatusRequest.loading;
    var response = await ratingData.addRating(
        itemsid, myServices.sharedpref.getString('id')!, rating, comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            titleText: Text('Success'),
            messageText: Text('The Item has been rating successfully'));
        Get.back();
        // List responsedata = response['data'];
        // data.addAll(responsedata.map((e) => RateModel.fromJson(e)));
        // Get.rawSnackbar(
        //     title: 'إشعار', messageText: const Text('تم تقيم المنتج بنجاح'));
        // update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }
}
