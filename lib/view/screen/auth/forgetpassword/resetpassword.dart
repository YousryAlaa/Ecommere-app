import 'package:ecommerce/controller/authcontroller/resetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "ResPassTit1".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: GetBuilder<ResetPasswordControllerIm>(
            builder: (controller) => HandlingDataResult(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: AppColor.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        const CustomTitleAuth(title: "ResPassTit2"),
                        const CustomBodyAuth(body: "ResPassBod"),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: controller.formstate,
                            child: Column(
                              children: [
                                GetBuilder<ResetPasswordControllerIm>(
                                  builder: (controller) => CustomTextFormAuth(
                                    isnumber: false,
                                    obscuretext: controller.isshowpass,
                                    onTapIcon: () {
                                      controller.showOrHidePass();
                                    },
                                    validator: (val) {
                                      return validInput(
                                          val!, 50, 5, "password");
                                    },
                                    hint: "ResPasshint1",
                                    label: "ResPassLab1",
                                    icon: Icons.password_outlined,
                                    mycontroller: controller.password1,
                                  ),
                                ),
                                GetBuilder<ResetPasswordControllerIm>(
                                  builder: (controller) => CustomTextFormAuth(
                                    isnumber: false,
                                    obscuretext: controller.isshowpass,
                                    onTapIcon: () {
                                      controller.showOrHidePass();
                                    },
                                    validator: (val) {
                                      return validInput(
                                          val!, 50, 5, "password");
                                    },
                                    hint: "ResPasshint2",
                                    label: "ResPassLab2",
                                    icon: Icons.password_outlined,
                                    mycontroller: controller.password2,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtonAuth(
                          onPressed: () {
                            controller.login();
                          },
                          text: "ResPassBtn".tr,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
