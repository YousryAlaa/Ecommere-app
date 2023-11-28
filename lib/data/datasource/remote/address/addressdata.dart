import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  getAddress(String usersid) async {
    var response =
        await crud.postData(LinkApi.viewaddress, {'usersid': usersid});
    return response.fold((l) => l, (r) => r);
  }

  addAddress(String usersid, String city, String street, String name) async {
    var response = await crud.postData(LinkApi.addaddress,
        {'usersid': usersid, 'city': city, 'street': street, 'name': name});
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String city, String street, String name, String addressid) async {
    var response = await crud.postData(LinkApi.addaddress,
        {'city': city, 'street': street, 'name': name, 'addressid': addressid});
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressid) async {
    var response =
        await crud.postData(LinkApi.deleteaddress, {'addressid': addressid});
    return response.fold((l) => l, (r) => r);
  }
}
