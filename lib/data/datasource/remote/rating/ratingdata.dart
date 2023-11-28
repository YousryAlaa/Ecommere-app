import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class RatingData {
  Crud crud;
  RatingData(this.crud);

  addRating(
      String itemsid, String usersid, String rating, String comment) async {
    var response = await crud.postData(LinkApi.addrating, {
      'userid': usersid,
      'itemsid': itemsid,
      'rating': rating,
      'comment': comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
