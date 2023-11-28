import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTitleCheckOut extends StatelessWidget {
  final String title;
  const CustomTitleCheckOut({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColor.primarycolor),
    );
  }
}
