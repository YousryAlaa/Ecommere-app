import 'package:ecommerce/controller/home/settingscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2.7,
              color: AppColor.primarycolor,
            ),
            Positioned(
                top: Get.width / 4.5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  padding: EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                    radius: 50,
                  ),
                ))
          ],
        ),
        SizedBox(
          height: 100,
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Disable notifications'),
                trailing:
                    Switch(value: true, onChanged: (value) => value = false),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.pendingorder);
                },
                title: Text('Orders'),
                trailing: Icon(Icons.card_travel_outlined),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.archiveorder);
                },
                title: Text('Archive'),
                trailing: Icon(Icons.archive_outlined),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoutes.viewaddress);
                },
                title: Text('Address'),
                trailing: Icon(Icons.location_on_outlined),
              ),
              Divider(),
              ListTile(
                title: Text('About us'),
                trailing: Icon(Icons.info_outline),
              ),
              Divider(),
              ListTile(
                onTap: () async {
                  await launchUrl(Uri.parse("tel:+201023365793"));
                },
                title: Text('Contact us'),
                trailing: Icon(Icons.call),
              ),
              Divider(),
              ListTile(
                title: Text('Logout'),
                trailing: Icon(Icons.logout_outlined),
                onTap: () {
                  controller.logout();
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}
