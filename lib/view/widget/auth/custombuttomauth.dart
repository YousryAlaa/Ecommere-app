import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      textColor: AppColor.backgroundColor,
      color: AppColor.primarycolor,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
