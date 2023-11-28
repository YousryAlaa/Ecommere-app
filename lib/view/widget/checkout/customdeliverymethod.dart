import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDeliveyMethod extends StatelessWidget {
  final String imagename;
  final String methodname;
  final bool isActive;
  const CustomDeliveyMethod(
      {super.key,
      required this.imagename,
      required this.methodname,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
          color: isActive == true ? AppColor.primarycolor : null,
          border: Border.all(color: AppColor.primarycolor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagename,
            height: 80,
            width: 80,
            color: isActive == true ? Colors.white : null,
          ),
          Text(
            methodname,
            style: TextStyle(
                color: isActive == true ? Colors.white : AppColor.primarycolor,
                fontWeight: isActive == true ? FontWeight.bold : null,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
