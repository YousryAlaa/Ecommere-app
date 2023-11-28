import 'package:ecommerce/controller/home/homepagecontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';
import 'package:ecommerce/core/constant/routes.dart';
import 'package:ecommerce/core/function/translatedatabase.dart';
import 'package:ecommerce/view/widget/customappbar.dart';
import 'package:ecommerce/view/widget/home/customoffer.dart';
import 'package:ecommerce/view/widget/home/customtitlehome.dart';
import 'package:ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:ecommerce/view/widget/home/listitemshome.dart';
import 'package:ecommerce/view/widget/items/customlistsearchitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerIm homecontroller = Get.put(HomeControllerIm());
    return GetBuilder<HomeControllerIm>(
      builder: (controller) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBar(
              onMyChanged: (val) {
                controller.checkSearch(val);
              },
              searchcontroller: controller.searchcontroller,
              onPressedIcon: () {
                controller.onSearch();
              },
              hinttext: 'CutsomSearchAppbar'.tr,
              onPressedMyFavorie: () {
                Get.toNamed(AppRoutes.myfavorite);
              },
            ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.issearch == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomOffer(
                            title: translateDatabase(homecontroller.hometitlear,
                                homecontroller.hometitle),
                            body: translateDatabase(homecontroller.homebodyar,
                                homecontroller.homebody),
                          ),
                          CustomTitleHome(title: "CategoriesName".tr),
                          const ListCategoriesHome(),
                          if (controller.items.isNotEmpty)
                            CustomTitleHome(title: "CutomTitle1".tr),
                          if (controller.items.isNotEmpty)
                            const ListItemsHome(),
                          CustomTitleHome(title: "CustomTitle2".tr),
                          const CustomListItemsOffersHome()
                        ],
                      )
                    : ListView.builder(
                        itemCount: controller.searchlist.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomListSearchItems(
                            itemsModel: controller.searchlist[index],
                          );
                        }))
          ],
        ),
      ),
    );
  }
}
