import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/home/homepagedata.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends MixSearchController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryid);
  goToProudctDetails(ItemsModel itemsModel);
}

class HomeControllerIm extends HomeController {
  MyServices myServices = Get.find();
  String? username;
  HomeData homeData = HomeData(Get.find());
  List data = [];
  List categories = [];
  List items = [];
  List itemsoffer = [];
  List settings = [];
  String hometitle = "";
  String hometitlear = "";
  String homebody = "";
  String homebodyar = "";
  String deliveytime = "";

  @override
  initialData() {
    username = myServices.sharedpref.getString('username');
    searchcontroller = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        if (response['items']['status'] == 'success') {
          items.addAll(response['items']['data']);
        }
        itemsoffer.addAll(response['itemsoffer']['data']);
        settings.addAll(response['settings']['data']);
        hometitle = settings[0]['settings_title'];
        hometitlear = settings[0]['settings_titlear'];
        homebody = settings[0]['settings_body'];
        homebodyar = settings[0]['settings_bodyar'];
        deliveytime = settings[0]['settings_deliveytime'].toString();

        print(settings);

        print(categories);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'selectedcat': selectedCat,
      'categoryid': categoryid
    });
  }

  @override
  goToProudctDetails(itemsModel) {
    Get.toNamed(AppRoutes.productdetails,
        arguments: {'itemsmodel': itemsModel});
  }
}

class MixSearchController extends GetxController {
  List<ItemsModel> searchlist = [];
  TextEditingController? searchcontroller;
  bool issearch = false;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.searchData(searchcontroller!.text);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchlist.clear();
        List responsedata = response['data'];
        searchlist.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        print(
            '-------------------------------------- search ----------------------------');
        print(searchlist);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearch(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      issearch = false;
    }
    update();
  }

  onSearch() {
    issearch = true;

    searchData();
    update();
  }
}
