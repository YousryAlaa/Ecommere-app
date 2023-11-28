import 'package:ecommerce/controller/authcontroller/verifycodecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerIm());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "VerifyCodeTit1".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: GetBuilder<VerifyCodeControllerIm>(
            builder: (controller) => HandlingDataResult(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    color: AppColor.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        const CustomTitleAuth(title: "VerifyCodeTit2"),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomBodyAuth(body: "VerifyCodeBod"),
                        const SizedBox(
                          height: 20,
                        ),
                        OtpTextField(
                          cursorColor: AppColor.primarycolor,
                          borderRadius: BorderRadius.circular(10),
                          focusedBorderColor: AppColor.primarycolor,
                          keyboardType: TextInputType.number,
                          numberOfFields: 5,

                          showFieldAsBox: true,

                          onCodeChanged: (String code) {},

                          onSubmit: (String verificationCode) {
                            controller.goToResetPassword(verificationCode);
                          }, // end onSubmit
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
