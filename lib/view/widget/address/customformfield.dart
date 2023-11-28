import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextFormAddress extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String? val) validator;

  const CustomTextFormAddress({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.mycontroller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: validator,
        cursorColor: AppColor.primarycolor,
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.primarycolor),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            hintText: hint.tr,
            hintStyle: const TextStyle(fontSize: 14),
            labelText: label.tr,
            suffixIcon: Icon(icon),
            focusColor: AppColor.primarycolor,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
