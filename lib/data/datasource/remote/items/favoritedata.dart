import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(String itemsid, String usersid) async {
    var response = await crud
        .postData(LinkApi.addfavorite, {'userid': usersid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String itemsid, String usersid) async {
    var response = await crud.postData(
        LinkApi.deletefavorite, {'userid': usersid, 'itemsid': itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
