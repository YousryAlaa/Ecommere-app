import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/pendingorderdata.dart';
import 'package:ecommerce/data/model/myordermodel.dart';
import 'package:get/get.dart';

class PendingOrderController extends GetxController {
  PendingOrderData pendingOrderData = PendingOrderData(Get.find());
  MyServices myServices = Get.find();
  List<MyOrderModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  String printOrderType(String val) {
    if (val == '0') {
      return 'Delivery';
    } else {
      return 'Receive';
    }
  }

  String printPaymentMethod(String val) {
    if (val == '0') {
      return 'Cash On Delivery';
    } else {
      return 'Payment Card';
    }
  }

  String printOrderStatus(String val) {
    if (val == '0') {
      return 'Pending Approvl';
    } else if (val == '1') {
      return 'Prepare';
    } else if (val == '2') {
      return 'On The Way';
    } else {
      return 'Archive';
    }
  }

  getOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await pendingOrderData.getData(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        data.clear();
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => MyOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder(String orderid) async {
    statusRequest = StatusRequest.loading;
    var response = await pendingOrderData.deleteData(orderid);
    refreshOrders();
    update();
  }

  refreshOrders() {
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
