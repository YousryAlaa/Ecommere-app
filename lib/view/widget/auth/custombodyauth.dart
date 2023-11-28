import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomBodyAuth extends StatelessWidget {
  final String body;
  const CustomBodyAuth({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Text(
      body.tr,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );
  }
}
