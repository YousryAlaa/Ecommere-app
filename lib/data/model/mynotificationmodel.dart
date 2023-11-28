class MyNotificationModel {
  int? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  int? notificationsUsersid;
  String? notificationsDatetime;

  MyNotificationModel(
      {this.notificationsId,
      this.notificationsTitle,
      this.notificationsBody,
      this.notificationsUsersid,
      this.notificationsDatetime});

  MyNotificationModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsUsersid = json['notifications_usersid'];
    notificationsDatetime = json['notifications_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications_id'] = this.notificationsId;
    data['notifications_title'] = this.notificationsTitle;
    data['notifications_body'] = this.notificationsBody;
    data['notifications_usersid'] = this.notificationsUsersid;
    data['notifications_datetime'] = this.notificationsDatetime;
    return data;
  }
}
