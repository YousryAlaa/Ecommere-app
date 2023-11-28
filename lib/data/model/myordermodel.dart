class MyOrderModel {
  int? orderId;
  int? orderUsersid;
  int? orderAddressid;
  int? orderType;
  int? orderPricedelivery;
  int? orderPrice;
  int? orderTotalprice;
  int? orderCoupon;
  int? orderRating;
  String? orderNoterating;
  int? orderPaymentmehod;
  int? orderStatus;
  String? orderDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  int? addressLat;
  int? addressLong;

  MyOrderModel(
      {this.orderId,
      this.orderUsersid,
      this.orderAddressid,
      this.orderType,
      this.orderPricedelivery,
      this.orderPrice,
      this.orderTotalprice,
      this.orderCoupon,
      this.orderRating,
      this.orderNoterating,
      this.orderPaymentmehod,
      this.orderStatus,
      this.orderDatetime,
      this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUsersid = json['order_usersid'];
    orderAddressid = json['order_addressid'];
    orderType = json['order_type'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderCoupon = json['order_coupon'];
    orderRating = json['order_rating'];
    orderNoterating = json['order_noterating'];
    orderPaymentmehod = json['order_paymentmehod'];
    orderStatus = json['order_status'];
    orderDatetime = json['order_datetime'];
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_usersid'] = this.orderUsersid;
    data['order_addressid'] = this.orderAddressid;
    data['order_type'] = this.orderType;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['order_coupon'] = this.orderCoupon;
    data['order_rating'] = this.orderRating;
    data['order_noterating'] = this.orderNoterating;
    data['order_paymentmehod'] = this.orderPaymentmehod;
    data['order_status'] = this.orderStatus;
    data['order_datetime'] = this.orderDatetime;
    data['address_id'] = this.addressId;
    data['address_usersid'] = this.addressUsersid;
    data['address_name'] = this.addressName;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
