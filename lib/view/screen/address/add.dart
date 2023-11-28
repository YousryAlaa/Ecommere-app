import 'package:ecommerce/controller/address/addresscontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/address/customformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    AddressControllerIm controller = Get.put(AddressControllerIm());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new address'),
          backgroundColor: AppColor.backgroundColor,
        ),
        body: GetBuilder<AddressControllerIm>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  Form(
                      key: controller.formstate,
                      child: Column(
                        children: [
                          CustomTextFormAddress(
                            hint: 'City',
                            label: 'City',
                            icon: Icons.location_city_outlined,
                            mycontroller: controller.citycontroller!,
                            validator: (val) => validInput(val!, 20, 0, 'type'),
                          ),
                          CustomTextFormAddress(
                            hint: 'Street',
                            label: 'Street',
                            icon: Icons.location_on_outlined,
                            mycontroller: controller.streetcontroller!,
                            validator: (val) => validInput(val!, 20, 0, 'type'),
                          ),
                          CustomTextFormAddress(
                            hint: 'Name',
                            label: 'Name',
                            icon: Icons.near_me_outlined,
                            mycontroller: controller.namecontroller!,
                            validator: (val) => validInput(val!, 20, 0, 'type'),
                          ),
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: AppColor.primarycolor,
                        borderRadius: BorderRadius.circular(20)),
                    child: MaterialButton(
                      textColor: Colors.white,
                      onPressed: () {
                        controller.addAddress();
                      },
                      child: Container(
                        child: const Text(
                          'Add',
                          style: TextStyle(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
