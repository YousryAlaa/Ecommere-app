import 'package:ecommerce/controller/order/pendingordercontroller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requsetPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmconfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer.playNotification();

    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  if (Get.currentRoute == "/pendingorder" &&
      data['pagename'] == 'refreshorderpending') {
    PendingOrderController controller = Get.find();
    controller.refreshOrders();
  }
}
