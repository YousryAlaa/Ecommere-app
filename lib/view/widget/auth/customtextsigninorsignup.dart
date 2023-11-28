import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextSignInOrSignUp extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const CustomTextSignInOrSignUp(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1.tr,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              text2.tr,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: AppColor.primarycolor, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
