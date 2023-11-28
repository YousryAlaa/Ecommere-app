import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/function/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  var res;
  inialdata() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    inialdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(50),
        child: OtpTextField(
          cursorColor: AppColor.purple,
          borderRadius: BorderRadius.circular(10),
          focusedBorderColor: AppColor.purple,
          keyboardType: TextInputType.number,
          numberOfFields: 5,
          borderColor: AppColor.purple,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          }, // end onSubmit
        ),
      ),
    );
  }
}
