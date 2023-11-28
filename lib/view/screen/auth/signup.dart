import 'package:ecommerce/controller/authcontroller/signupcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/function/alertexitapp.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtextsigninorsignup.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "SigUpTit".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<SignUpControllerIm>(
                builder: (controller) => HandlingDataResult(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: ListView(
                          children: [
                            const CustomTitleAuth(title: "Log2"),
                            const CustomBodyAuth(body: "SigUpBod"),
                            const SizedBox(
                              height: 10,
                            ),
                            Form(
                                key: controller.formstate,
                                child: Column(
                                  children: [
                                    CustomTextFormAuth(
                                      isnumber: false,
                                      validator: (val) {
                                        return validInput(
                                            val!, 50, 5, "username");
                                      },
                                      hint: "SignUphint1",
                                      label: "SignUpLab1",
                                      icon: Icons.person_outline,
                                      mycontroller: controller.username,
                                    ),
                                    CustomTextFormAuth(
                                      isnumber: false,
                                      validator: (val) {
                                        return validInput(
                                            val!, 100, 5, "email");
                                      },
                                      hint: "SignUphint2",
                                      label: "SignUpLab2",
                                      icon: Icons.email_outlined,
                                      mycontroller: controller.email,
                                    ),
                                    CustomTextFormAuth(
                                      isnumber: true,
                                      validator: (val) {
                                        return validInput(val!, 11, 5, "phone");
                                      },
                                      hint: "SignUphint3",
                                      label: "SignUpLab3",
                                      icon: Icons.phone_android_outlined,
                                      mycontroller: controller.phone,
                                    ),
                                    GetBuilder<SignUpControllerIm>(
                                        builder: (controller) =>
                                            CustomTextFormAuth(
                                              obscuretext: controller.ishowpass,
                                              onTapIcon: () {
                                                controller.showOrHidePass();
                                              },
                                              isnumber: false,
                                              validator: (val) {
                                                return validInput(
                                                    val!, 50, 5, "password");
                                              },
                                              hint: "SignUphint4",
                                              label: "SignUpLab4",
                                              icon: Icons.password_outlined,
                                              mycontroller: controller.password,
                                            ))
                                  ],
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButtonAuth(
                              onPressed: () {
                                controller.signUp();
                              },
                              text: "SignUpBtn".tr,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextSignInOrSignUp(
                              text1: "SignUpText1",
                              text2: "SignUpText2",
                              onTap: () {
                                controller.goToLogin();
                              },
                            )
                          ],
                        ),
                      ),
                    ))));
  }
}
