import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  addData(
      String usersid,
      String addressid,
      String ordertype,
      String orderprice,
      String ordercoupon,
      String orderpaymentmethod,
      String discountcoupon) async {
    Map data = {
      "usersid": usersid,
      "addressid": addressid,
      "ordertype": ordertype,
      "orderprice": orderprice,
      "ordercoupon": ordercoupon,
      "orderpaymentmethod": orderpaymentmethod,
      "discountcoupon": discountcoupon
    };
    var response = await crud.postData(LinkApi.checkout, data);
    return response.fold((l) => l, (r) => r);
  }
}
