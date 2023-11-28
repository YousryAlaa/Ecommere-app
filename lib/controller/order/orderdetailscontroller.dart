import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/orders/orderdetailsdata.dart';
import 'package:ecommerce/data/model/myordermodel.dart';
import 'package:ecommerce/data/model/orderdetailsmodel.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  MyOrderModel? myOrderModel;
  late StatusRequest statusRequest;
  List<OrderDetailsModel> data = [];
  OrderDetailsData orderDetailsData = OrderDetailsData(Get.find());

  int priceCeil(double price) {
    return price.ceil();
  }

  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await orderDetailsData.getData(myOrderModel!.orderId.toString());
    statusRequest = handlingData(response);
    print(statusRequest);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        print('success');
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => OrderDetailsModel.fromJson(e)));
        print('--------------- order details');
        print(data);
      } else {
        print('failure');
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    myOrderModel = Get.arguments['orderdetails'];
    getOrderDetails();
    super.onInit();
  }
}
