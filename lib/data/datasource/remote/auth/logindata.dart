import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  loginData(String email, String password) async {
    var response = await crud.postData(LinkApi.login, {
      'email': email,
      'password': password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
