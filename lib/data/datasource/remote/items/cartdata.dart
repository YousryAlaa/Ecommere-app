import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addCart(String itemsid, String usersid, String itemsprice) async {
    var response = await crud.postData(LinkApi.addcart,
        {'usersid': usersid, 'itemsid': itemsid, 'itemsprice': itemsprice});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String itemsid, String usersid) async {
    var response = await crud
        .postData(LinkApi.deletecart, {'usersid': usersid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getItemsCartCount(String itemsid, String usersid) async {
    var response = await crud.postData(
        LinkApi.getitemscount, {'usersid': usersid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
