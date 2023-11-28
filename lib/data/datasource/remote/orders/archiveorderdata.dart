import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ArchiveOrderData {
  Crud crud;
  ArchiveOrderData(this.crud);

  getData(
    String usersid,
  ) async {
    Map data = {
      "usersid": usersid,
    };
    var response = await crud.postData(LinkApi.archiveorder, data);
    return response.fold((l) => l, (r) => r);
  }

  updateData(String orderid, String rating, String comment) async {
    Map data = {"orderid": orderid, "rating": rating, "comment": comment};
    var response = await crud.postData(LinkApi.rating, data);
    return response.fold((l) => l, (r) => r);
  }
}
