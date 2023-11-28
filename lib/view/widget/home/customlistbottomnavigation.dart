import 'package:ecommerce/controller/home/homescreencontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/home/custombuttonbottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomListBottonNavigation extends StatelessWidget {
  const CustomListBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerIm>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomButtonBottomBar(
                      onPressed: () {
                        controller.changePage(i);
                      },
                      buttonname: controller.listName[i],
                      icon: controller.listIcon[i],
                      selectedColor: controller.currentpage == i
                          ? AppColor.primarycolor
                          : AppColor.grey2);
            })

            // Row(
            //   children: [
            //     CustomButtonBottomBar(
            //         onPressed: () {
            //           controller.changePage(0);
            //         },
            //         buttonname: 'Home',
            //         icon: Icons.home,
            //         selectedColor: controller.currentpage == 0
            //             ? AppColor.primarycolor
            //             : Colors.black),
            //     CustomButtonBottomBar(
            //         onPressed: () {
            //           controller.changePage(1);
            //         },
            //         buttonname: 'Settings',
            //         icon: Icons.settings,
            //         selectedColor: controller.currentpage == 1
            //             ? AppColor.primarycolor
            //             : Colors.black)
            //   ],
            // ),
            // Spacer(),
            // Row(
            //   children: [
            //     CustomButtonBottomBar(
            //         onPressed: () {
            //           controller.changePage(2);
            //         },
            //         buttonname: 'Profile',
            //         icon: Icons.person,
            //         selectedColor: controller.currentpage == 2
            //             ? AppColor.primarycolor
            //             : Colors.black),
            //     CustomButtonBottomBar(
            //         onPressed: () {
            //           controller.changePage(3);
            //         },
            //         buttonname: 'Favorite',
            //         icon: Icons.favorite,
            //         selectedColor: controller.currentpage == 3
            //             ? AppColor.primarycolor
            //             : Colors.black)
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
