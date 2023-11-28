import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';
import 'package:flutter/src/widgets/editable_text.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(LinkApi.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(
    String search,
  ) async {
    var response = await crud.postData(LinkApi.searchitems, {'search': search});
    return response.fold((l) => l, (r) => r);
  }
}
