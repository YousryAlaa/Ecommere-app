import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);
  checkCoupon(String couponname) async {
    var response =
        await crud.postData(LinkApi.checkcoupon, {'couponname': couponname});
    return response.fold((l) => l, (r) => r);
  }
}
