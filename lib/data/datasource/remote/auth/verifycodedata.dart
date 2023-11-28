import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verificationCode) async {
    var response = await crud.postData(LinkApi.verifycode, {
      'email': email,
      'verifycode': verificationCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
