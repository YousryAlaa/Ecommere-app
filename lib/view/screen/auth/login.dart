import 'package:ecommerce/controller/authcontroller/logincontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/function/alertexitapp.dart';
import 'package:ecommerce/core/function/validinput.dart';
import 'package:ecommerce/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce/view/widget/auth/custombuttomauth.dart';
import 'package:ecommerce/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce/view/widget/auth/customtextsigninorsignup.dart';
import 'package:ecommerce/view/widget/auth/customtitleauth.dart';
import 'package:ecommerce/view/widget/auth/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerIm());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Log1".tr,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: WillPopScope(
            onWillPop: alertExitApp,
            child: GetBuilder<LoginControllerIm>(
                builder: (controller) => HandlingDataResult(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        child: ListView(
                          children: [
                            const LogoAuth(),
                            const CustomTitleAuth(title: "Log2"),
                            const CustomBodyAuth(body: "Log3"),
                            const SizedBox(
                              height: 10,
                            ),
                            Form(
                                key: controller.formstate,
                                child: Column(
                                  children: [
                                    CustomTextFormAuth(
                                      isnumber: false,
                                      hint: "Log5",
                                      label: "Log4",
                                      icon: Icons.email_outlined,
                                      mycontroller: controller.email,
                                      validator: (val) {
                                        return validInput(
                                            val!, 100, 5, "email");
                                      },
                                    ),
                                    GetBuilder<LoginControllerIm>(
                                      builder: (controller) =>
                                          CustomTextFormAuth(
                                        onTapIcon: () {
                                          controller.showOrHidePass();
                                        },
                                        obscuretext: controller.isshowpass,
                                        isnumber: false,
                                        validator: (val) {
                                          return validInput(
                                              val!, 50, 5, "password");
                                        },
                                        hint: "Log7",
                                        label: "Log6",
                                        icon: Icons.password_outlined,
                                        mycontroller: controller.password,
                                      ),
                                    )
                                  ],
                                )),
                            InkWell(
                              onTap: () {
                                controller.goToForgetPassword();
                              },
                              child: Text(
                                textAlign: TextAlign.end,
                                "Log9".tr,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomButtonAuth(
                              onPressed: () {
                                controller.login();
                              },
                              text: "Log10".tr,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextSignInOrSignUp(
                              text1: "Log11",
                              text2: "Log12",
                              onTap: () {
                                controller.goToSignUp();
                              },
                            )
                          ],
                        ),
                      ),
                    ))));
  }
}
