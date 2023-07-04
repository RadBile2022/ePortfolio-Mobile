import 'package:eportfolio_mobile/views/account.dart';
import 'package:eportfolio_mobile/views/components/drop_down.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/get-user-page.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:eportfolio_mobile/views/pages/PROFILE.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsMain extends StatelessWidget {
  final bottomSheetController = Get.find<BottomSheetController>();

  final tabController = Get.put(TabControllers());

  final VoidCallback $onTapEditHoriz = () {
    print('asdfkjdsaf');
  };
  final VoidCallback $onTapDeleteHoriz = () {
    print('asdfkjdsaf');
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: tabController.currentIndex.value,
          children: [
            Home(),
            // CustomerListPage(),
            Account(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: tabController.currentIndex.value,
          onTap: tabController.changeTab,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Discovery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: 'Tab 3',
            // ),
          ],
        ),
      ),
      bottomSheet: Obx(
        () {
          return Visibility(
            visible: bottomSheetController.isBottomSheetOpen.value,
            child: BottomSheetHoriz(
              $onTapEditHoriz: $onTapEditHoriz,
              $onTapDeleteHoriz: $onTapDeleteHoriz,
            ),
          );
        },
      ),
    );
  }
}
