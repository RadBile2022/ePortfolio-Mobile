import 'package:eportfolio_mobile/views/components/profile_bar.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/get-user-page.dart';
import 'package:eportfolio_mobile/views/pages/PROFILECtrl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  final profilePageController = Get.find<ProfilePageController>();

  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Function(String) $onTapMoreHoriz = (String id) {};
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                background: GetBuilder<CurrentUserController>(
                  builder: (controller) {
                    final user = controller.currentUser.value;
                    return Profile_Bar(
                      profilePicture: user.profilePicture,
                      name: user.username,
                      role: user.role,
                      major: user.major,
                      nim: user.nim,
                      interest: user.interest,
                      academicField: user.academicField,
                      following: user.followings,
                      followers: user.followers,
                    );
                  },
                ),
              ),
              expandedHeight: 350,
              backgroundColor: Colors.white,
              pinned: true,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(2),
                  child: Column(
                    children: [
                      TabBar(
                        tabs: profilePageController.myTabs,
                        controller: profilePageController.tabController,
                        labelColor: Colors.black,
                        isScrollable: true,
                      ),
                    ],
                  )),
            ),
          ],
          body: TabBarView(
            controller: profilePageController.tabController,
            children: profilePageController.myTabViews,
          ),
        ));
  }
}
