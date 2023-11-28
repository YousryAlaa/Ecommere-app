import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class PendingOrderData {
  Crud crud;
  PendingOrderData(this.crud);

  getData(
    String usersid,
  ) async {
    Map data = {
      "usersid": usersid,
    };
    var response = await crud.postData(LinkApi.orders, data);
    return response.fold((l) => l, (r) => r);
  }

  deleteData(
    String orderid,
  ) async {
    Map data = {
      "orderid": orderid,
    };
    var response = await crud.postData(LinkApi.orderdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
