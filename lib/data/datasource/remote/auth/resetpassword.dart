import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(
        LinkApi.resetpassword, {'email': email, 'newpassword': password});
    return response.fold((l) => l, (r) => r);
  }
}
