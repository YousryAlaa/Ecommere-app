import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonLanguage(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        onPressed: onPressed,
        textColor: Colors.white,
        color: AppColor.primarycolor,
        child: Text(text),
      ),
    );
  }
}
