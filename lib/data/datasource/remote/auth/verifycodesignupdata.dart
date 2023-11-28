import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeSignupData {
  Crud crud;
  VerifyCodeSignupData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(LinkApi.verifycodesignup, {
      'email': email,
      'verifycode': verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(LinkApi.resendcode, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
