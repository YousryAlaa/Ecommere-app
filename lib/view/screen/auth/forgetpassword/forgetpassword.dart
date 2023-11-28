import 'package:ecommerce/controller/authcontroller/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "ForgPassTit1".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerIm>(
            builder: (controller) => HandlingDataResult(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: AppColor.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        const CustomTitleAuth(title: "ForgPassTit2"),
                        const CustomBodyAuth(body: "ForgPassBod"),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                            key: controller.formstate,
                            child: Column(
                              children: [
                                CustomTextFormAuth(
                                  isnumber: false,
                                  validator: (val) {
                                    return validInput(val!, 100, 5, "email");
                                  },
                                  hint: "Log5",
                                  label: "Log4",
                                  icon: Icons.email_outlined,
                                  mycontroller: controller.email,
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtonAuth(
                          onPressed: () {
                            controller.goToVerifyCode();
                          },
                          text: "ForgPassBtn".tr,
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
