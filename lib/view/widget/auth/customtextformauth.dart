import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hint;
  final String label;
  final IconData icon;
  final TextEditingController mycontroller;
  final String? Function(String? val) validator;
  final bool isnumber;
  final bool? obscuretext;
  final void Function()? onTapIcon;

  const CustomTextFormAuth({
    super.key,
    required this.hint,
    required this.label,
    required this.icon,
    required this.mycontroller,
    required this.validator,
    required this.isnumber,
    this.obscuretext,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: obscuretext == null || obscuretext == false ? false : true,
        keyboardType: isnumber == true
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
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
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(icon)),
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
