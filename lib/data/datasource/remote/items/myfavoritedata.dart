import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(LinkApi.myfavorite, {'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String favoriteid) async {
    var response = await crud
        .postData(LinkApi.deletefrommyfavorite, {'favoriteid': favoriteid});
    return response.fold((l) => l, (r) => r);
  }
}
