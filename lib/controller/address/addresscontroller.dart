import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/addressdata.dart';
import 'package:ecommerce/data/model/myaddressmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AddressController extends GetxController {
  addAddress();
}

class AddressControllerIm extends AddressController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? citycontroller;
  TextEditingController? streetcontroller;
  TextEditingController? namecontroller;
  @override
  void onInit() {
    citycontroller = TextEditingController();
    streetcontroller = TextEditingController();
    namecontroller = TextEditingController();

    super.onInit();
  }

  @override
  addAddress() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      var response = await addressData.addAddress(
          myServices.sharedpref.getString('id')!,
          citycontroller!.text,
          streetcontroller!.text,
          namecontroller!.text);
      statusRequest = StatusRequest.loading;
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.rawSnackbar(
              title: 'Notification',
              message: 'Address has been added successfully');
          update();
          Get.offAllNamed(AppRoutes.homepage);
          Get.snackbar('Success', 'Now You Can Do Order');
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }
}
