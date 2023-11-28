import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/address/addressdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/checkoutdata.dart';
import 'package:ecommerce/data/model/myaddressmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  late String priceorder;
  late String couponid;

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentmethod;
  String? paymentdelivery;
  String addressid = '0';
  late String discountcoupon;
  List<MyAddressModel> listaddress = [];

  choosePaymentMethod(String val) {
    paymentmethod = val;
    update();
  }

  chooseDeliveryMethod(String val) {
    paymentdelivery = val;
    update();
  }

  chooseAddress(String val) {
    addressid = val;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.getAddress(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        listaddress.addAll(dataresponse.map((e) => MyAddressModel.fromJson(e)));
        addressid = listaddress[0].addressId.toString();
      } else {
        statusRequest = StatusRequest.success;
      }
    }
    update();
  }

  addData() async {
    if (paymentmethod == null) {
      return Get.snackbar('Error', 'You must choose payment method');
    }
    if (paymentdelivery == null)
      return Get.snackbar('Error', 'You must choose delivery method');

    if (listaddress.isEmpty) {
      return Get.snackbar('Error', 'You must add address');
    }

    statusRequest = StatusRequest.loading;
    var response = await checkoutData.addData(
        myServices.sharedpref.getString('id')!,
        addressid.toString(),
        paymentdelivery!,
        priceorder,
        couponid,
        paymentmethod!,
        discountcoupon);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(AppRoutes.homepage);
        Get.snackbar('Success', 'The order was saccessfully');
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar('Error', 'Please try again');
      }
    }
  }

  @override
  void onInit() {
    priceorder = Get.arguments['orderpice'];
    couponid = Get.arguments['couponid'];
    discountcoupon = Get.arguments['discountcoupon'];
    getData();
    super.onInit();
  }
}
