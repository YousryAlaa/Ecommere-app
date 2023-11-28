import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  getData(String categoryid, String userid) async {
    var response = await crud
        .postData(LinkApi.items, {'categoryid': categoryid, 'usersid': userid});
    return response.fold((l) => l, (r) => r);
  }
}
