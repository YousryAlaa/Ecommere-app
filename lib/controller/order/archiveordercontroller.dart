import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/orders/archiveorderdata.dart';
import 'package:ecommerce/data/model/myordermodel.dart';
import 'package:get/get.dart';

class ArchiveOrderController extends GetxController {
  ArchiveOrderData archiveOrderData = ArchiveOrderData(Get.find());
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
      return 'Order With Delivery ';
    } else if (val == '3') {
      return 'On The Way';
    } else {
      return 'Archive';
    }
  }

  submitRating(String orderid, double rating, String comment) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrderData.updateData(orderid, rating.toString(), comment);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getArchiveOrder() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await archiveOrderData.getData(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List datarespone = response['data'];
        data.addAll(datarespone.map((e) => MyOrderModel.fromJson(e)));
        print(datarespone);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getArchiveOrder();
    super.onInit();
  }
}
