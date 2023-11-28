import 'package:ecommerce/controller/home/productdetailscontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListGenerateColors extends GetView<ProductDetailsControllerIm> {
  const ListGenerateColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.colors.length,
          (index) => Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            height: 60,
            width: 90,
            decoration: BoxDecoration(
                color: controller.colors[index]['active'] == '1'
                    ? AppColor.fourthcolor
                    : Colors.white,
                border: Border.all(color: AppColor.fourthcolor),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "${controller.colors[index]['color']}",
              style: TextStyle(
                  color: controller.colors[index]['active'] == '1'
                      ? Colors.white
                      : AppColor.fourthcolor),
            ),
          ),
        ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: const EdgeInsets.only(right: 10),
        //   height: 60,
        //   width: 90,
        //   decoration: BoxDecoration(
        //       color: AppColor.fourthcolor,
        //       border: Border.all(color: AppColor.fourthcolor),
        //       borderRadius: BorderRadius.circular(10)),
        //   child: const Text(
        //     "Red",
        //     style: TextStyle(color: Colors.white),
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: const EdgeInsets.only(right: 10),
        //   height: 60,
        //   width: 90,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(color: AppColor.fourthcolor),
        //       borderRadius: BorderRadius.circular(10)),
        //   child: const Text(
        //     "Black",
        //     style: TextStyle(color: AppColor.fourthcolor),
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.center,
        //   margin: const EdgeInsets.only(right: 10),
        //   height: 60,
        //   width: 90,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border.all(color: AppColor.fourthcolor),
        //       borderRadius: BorderRadius.circular(10)),
        //   child: const Text(
        //     "Blue",
        //     style: TextStyle(color: AppColor.fourthcolor),
        //   ),
        // )
      ],
    );
  }
}
