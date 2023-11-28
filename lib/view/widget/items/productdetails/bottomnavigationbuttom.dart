import 'package:ecommerce/controller/home/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigButton extends GetView<ProductDetailsControllerIm> {
  const BottomNavigButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 40,
      child: MaterialButton(
        color: AppColor.secondcolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          controller.goToCart();
        },
        child: const Text(
          'Go To Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
