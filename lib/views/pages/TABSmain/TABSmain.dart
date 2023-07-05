import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/account.dart';
import 'package:eportfolio_mobile/views/components/drop_down.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
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
  final postController = Get.find<GetPostsController>();
  final tabController = Get.put(TabControllers());

  Future?  $onTapEditHoriz () {
    String id =    bottomSheetController.id.value;
    Get.toNamed(RouteNames.editPost, arguments: id);
  }
  
   Future? $onTapDeleteHoriz  ()  {
    String id =    bottomSheetController.id.value;
    // print(id);
     postController.deletePost(id);
    // await postController.removePost(id);
    // await postController.removePost(id);
  }

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
