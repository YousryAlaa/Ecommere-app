import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/addressdata.dart';
import 'package:ecommerce/data/model/myaddressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ViewAddressController extends GetxController {
  getAddress();
  deleteAddress(String addressid);
}

class ViewAddressControllerIm extends ViewAddressController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<MyAddressModel> data = [];
  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  @override
  getAddress() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.getAddress(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => MyAddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteAddress(addressid) {
    addressData.deleteAddress(addressid);
    data.removeWhere((element) => element.addressId.toString() == addressid);
    update();
  }
}
