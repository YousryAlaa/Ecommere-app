import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  TestData testdata = TestData(Get.find());
  List data = [];

  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
