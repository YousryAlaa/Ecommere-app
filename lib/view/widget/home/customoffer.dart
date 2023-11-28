import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOffer extends StatelessWidget {
  final String? title;
  final String? body;
  CustomOffer({super.key, required this.title, required this.body});
  MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              color: AppColor.primarycolor,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            title: Text(
              "${title}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              "${body}",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        myServices.sharedpref.getString('lang') == 'ar'
            ? Positioned(
                top: -20,
                left: -40,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColor.secondcolor,
                      borderRadius: BorderRadius.circular(160)),
                ),
              )
            : Positioned(
                top: -20,
                right: -40,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      color: AppColor.secondcolor,
                      borderRadius: BorderRadius.circular(160)),
                ),
              )
      ]),
    );
  }
}
