import 'package:eportfolio_mobile/views/account.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:eportfolio_mobile/views/pages/PROFILE.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabControllers extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}


class TabsMain extends StatelessWidget {
  final postController = Get.find<PostController>();
  final tabController = Get.put(TabControllers());

  TabsMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: tabController.currentIndex.value,
          children: [
            Home(),
            Account(),
            Profile(),
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
