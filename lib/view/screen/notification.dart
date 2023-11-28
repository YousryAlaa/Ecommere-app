import 'package:ecommerce/controller/notificationcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotifictionView extends StatelessWidget {
  const NotifictionView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => Container(
              padding: EdgeInsets.all(20),
              child: Container(
                child: ListView(
                  children: [
                    const Center(
                      child: Text(
                        'Notificaion',
                        style: TextStyle(
                            color: AppColor.primarycolor, fontSize: 20),
                      ),
                    ),
                    ...List.generate(
                        controller.data.length,
                        (index) => Container(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ListTile(
                                      title: Text(
                                          '${controller.data[index].notificationsTitle}'),
                                      subtitle: Text(
                                          '${controller.data[index].notificationsBody}'),
                                    ),
                                  ),
                                  Positioned(
                                      right: 0,
                                      top: 20,
                                      child: Text(
                                        Jiffy('${controller.data[index].notificationsDatetime}',
                                                'yyyy-MM-dd')
                                            .fromNow(),
                                        style: TextStyle(
                                            color: AppColor.primarycolor,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ))
                  ],
                ),
              ),
            ));
  }
}
