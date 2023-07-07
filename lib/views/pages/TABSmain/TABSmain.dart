import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/account.dart';
import 'package:eportfolio_mobile/views/components/modal-bottom-sheet.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/get-user-page.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:eportfolio_mobile/views/pages/PROFILE.dart';
import 'package:eportfolio_mobile/views/pages/TABSmain/TABcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class TabsMain extends StatelessWidget {
  final bottomSheetController = Get.find<BottomSheetController>();
  final postController = Get.find<PostController>();
  final tabController = Get.put(TabControllers());



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

    );
  }
}
