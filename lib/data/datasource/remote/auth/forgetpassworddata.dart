import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ForgetPasswordData {
  Crud crud;
  ForgetPasswordData(this.crud);

  postData(String email) async {
    var response = await crud.postData(LinkApi.forgetpassword, {
      'email': email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
