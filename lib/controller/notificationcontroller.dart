import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/function/handlingdata.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/data/datasource/remote/notification/notificationdata.dart';
import 'package:ecommerce/data/model/mynotificationmodel.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());
  List<MyNotificationModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  getNotify() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await notificationData.getData(myServices.sharedpref.getString('id')!);
    statusRequest = handlingData(response);
    update();
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataresponse = response['data'];
        data.addAll(dataresponse.map((e) => MyNotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getNotify();
    super.onInit();
  }
}
