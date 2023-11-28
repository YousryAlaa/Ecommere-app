import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonBottomBar extends StatelessWidget {
  final void Function() onPressed;
  final String buttonname;
  final IconData icon;
  final Color selectedColor;
  MyServices myServices = Get.find();

  CustomButtonBottomBar(
      {super.key,
      required this.onPressed,
      required this.buttonname,
      required this.icon,
      required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedColor,
          ),
          myServices.sharedpref.getString("lang") == 'ar'
              ? Text(
                  "${buttonname}",
                  style: TextStyle(color: selectedColor, fontSize: 9.9),
                )
              : Text(
                  "${buttonname}",
                  style: TextStyle(color: selectedColor, fontSize: 13),
                )
        ],
      ),
    );
  }
}
