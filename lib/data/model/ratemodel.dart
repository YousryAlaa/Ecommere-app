class RateModel {
  String? rate;
  String? sumitemsrating;
  int? countitems;
  int? ratingId;
  int? ratingUsersid;
  int? ratingItemsid;
  int? ratingRate;
  String? ratingComment;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  int? itemsDiscount;
  int? itemsRating;
  String? itemsNoterating;
  String? itemsDate;
  int? itemsCate;
  int? usersId;

  RateModel(
      {this.rate,
      this.sumitemsrating,
      this.countitems,
      this.ratingId,
      this.ratingUsersid,
      this.ratingItemsid,
      this.ratingRate,
      this.ratingComment,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsRating,
      this.itemsNoterating,
      this.itemsDate,
      this.itemsCate,
      this.usersId});

  RateModel.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    sumitemsrating = json['sumitemsrating'];
    countitems = json['countitems'];
    ratingId = json['rating_id'];
    ratingUsersid = json['rating_usersid'];
    ratingItemsid = json['rating_itemsid'];
    ratingRate = json['rating_rate'];
    ratingComment = json['rating_comment'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsRating = json['items_rating'];
    itemsNoterating = json['items_noterating'];
    itemsDate = json['items_date'];
    itemsCate = json['items_cate'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['sumitemsrating'] = this.sumitemsrating;
    data['countitems'] = this.countitems;
    data['rating_id'] = this.ratingId;
    data['rating_usersid'] = this.ratingUsersid;
    data['rating_itemsid'] = this.ratingItemsid;
    data['rating_rate'] = this.ratingRate;
    data['rating_comment'] = this.ratingComment;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_rating'] = this.itemsRating;
    data['items_noterating'] = this.itemsNoterating;
    data['items_date'] = this.itemsDate;
    data['items_cate'] = this.itemsCate;
    data['users_id'] = this.usersId;
    return data;
  }
}
