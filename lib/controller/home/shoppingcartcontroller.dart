import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/coupon/checkcoupon.dart';
import 'package:ecommerce/data/datasource/remote/items/cartdata.dart';
import 'package:ecommerce/data/datasource/remote/items/mycartdata.dart';
import 'package:ecommerce/data/model/mycartmodel.dart';
import 'package:ecommerce/data/model/mycouponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ShoppingCartController extends GetxController {
  intialData();
  getData();
  addCart(String itemsid, String itemsprice);
  deleteCart(String itemsid);
  checkCoupon();
  refreshpage();
  goToCheckout();
}

class ShoppingCartControllerIm extends ShoppingCartController {
  CartData cartData = CartData(Get.find());
  CouponData couponData = CouponData(Get.find());
  MyCouponModel? myCouponModel;
  int totalpriceceil = 0;
  double totalprice = 0.0;
  int totalcountitems = 0;
  int countitems = 0;
  int shipping = 300;
  double totalprice2 = 0;
  int totalprice3 = 0;
  int discountcoupon = 0;
  double discount2 = 0;
  TextEditingController? couponcontroller;
  Map<String, dynamic> coupondata = {};
  String? couponname;
  String? couponid;

  int itemsPriceCiel(double price) {
    return price.ceil();
  }

  @override
  void onInit() {
    couponcontroller = TextEditingController();
    intialData();
    super.onInit();
  }

  StatusRequest statusRequest = StatusRequest.none;
  MyCartData myCartData = MyCartData(Get.find());
  MyServices myServices = Get.find();
  List<MyCartModel> data = [];
  Map dataresponecountprice = {};
  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response =
        await myCartData.getData(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['datacart']['status'] == 'success') {
          List responsedata = response['datacart']['data'];
          dataresponecountprice = response['totalcountprice'];
          data.clear();
          data.addAll(responsedata.map((e) => MyCartModel.fromJson(e)));

          totalprice = dataresponecountprice['totalitemsprice'].toDouble();
          totalcountitems =
              int.parse(dataresponecountprice['totalitemescount']);
          totalpriceceil = totalprice.ceil();

          discount2 = discountcoupon.toDouble();

          totalprice2 =
              (totalprice - (totalprice * (discount2 / 100))) + shipping;
          totalprice3 = totalprice2.ceil();

          print('--------------------total price 2 ');
          print(totalprice2);
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  addCart(String itemsid, String itemsprice) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemsid, myServices.sharedpref.getString('id')!, itemsprice);
  }

  @override
  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        itemsid, myServices.sharedpref.getString('id')!);
  }

  @override
  intialData() {
    getData();
  }

  resetVarCart() {
    totalpriceceil = 0;
    totalcountitems = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    getData();
  }

  @override
  goToCheckout() {
    if (data.isEmpty) return Get.snackbar('Alert', 'The Cart Is Empty');
    Get.toNamed(AppRoutes.checkout, arguments: {
      'couponid': couponid ?? '0',
      'orderpice': totalpriceceil.toString(),
      'discountcoupon': discountcoupon.toString()
    });
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await couponData.checkCoupon(couponcontroller!.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        coupondata = response['data'];
        myCouponModel = MyCouponModel.fromJson(coupondata);

        discountcoupon = coupondata['coupon_discount'];
        couponname = myCouponModel!.couponName;
        couponid = myCouponModel!.couponId.toString();

        update();
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar('Warning', 'Coupon Not Valid');
        print(discountcoupon);
        update();
      }
    }
    update();
  }

  @override
  refreshpage() async {
    await getData();
  }
}
