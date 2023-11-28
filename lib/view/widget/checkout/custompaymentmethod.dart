import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomPaymentMethod extends StatelessWidget {
  final bool isActive;
  final String namepayment;
  const CustomPaymentMethod(
      {super.key, required this.namepayment, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.primarycolor : AppColor.color2,
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        namepayment,
        style: TextStyle(
            color: isActive == true ? Colors.white : AppColor.primarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 15),
      ),
    );
  }
}
