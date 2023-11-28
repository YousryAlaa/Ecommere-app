import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);

  getData() async {
    var response = await crud.postData(LinkApi.offers, {});
    return response.fold((l) => l, (r) => r);
  }
}
