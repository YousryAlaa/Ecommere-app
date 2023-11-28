import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTitleAuth extends StatelessWidget {
  final String title;
  const CustomTitleAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title.tr,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
