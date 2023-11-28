import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class MyCartData {
  Crud crud;
  MyCartData(this.crud);

  getData(String usersid) async {
    var response = await crud.postData(LinkApi.mycart, {'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }
}
