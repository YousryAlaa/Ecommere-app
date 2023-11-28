import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomCardAddress extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isActive;
  const CustomCardAddress(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: isActive == true ? AppColor.primarycolor : Colors.white,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              color: isActive == true ? Colors.white : AppColor.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: isActive == true ? Colors.white : AppColor.black),
        ),
      ),
    );
  }
}
