import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:ecommerce/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, height: 250, width: 250))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    height: 250, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.serverfailure,
                        height: 250, width: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImageAsset.nodata,
                            height: 250, width: 250, repeat: false))
                    : widget;
  }
}

class HandlingDataResult extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataResult(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
            AppImageAsset.loading,
            height: 250,
            width: 250,
          ))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    height: 250, width: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: Lottie.asset(AppImageAsset.serverfailure,
                        height: 250, width: 250))
                : widget;
  }
}
