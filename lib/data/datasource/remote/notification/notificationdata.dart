import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(LinkApi.notification, {'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }
}
