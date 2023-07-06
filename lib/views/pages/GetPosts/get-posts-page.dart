import 'dart:convert';

import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/drop_down.dart';
import 'package:eportfolio_mobile/views/components/post_account_card.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/components/profile-containers.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class PostsTab extends StatelessWidget {
  final bottomSheetController = Get.find<BottomSheetController>();
  final postController = Get.find<GetPostsController>();

  final GetUser postUser;
  final List<dynamic> postAll;

  PostsTab({
    super.key,
    required this.postUser,
    required this.postAll,
  });

  final GestureTapCallback $onTapAccount = () {
    print('halo');
  };

  PopupMenuItemSelected? $onSelected(String result) {
    print(result);
    return null;
  }

  final VoidCallback $onButtonMore = () {
    print('asdfkjdsaf');
  };

  Future? $addOnPressed() async {
    // final url = Uri.parse('https://api-portfolio.gft.academy/api/posts/64a4e50bce1f9436a4f6b112');
    //
    // final response = await delete(url);
    //
    // if (response.statusCode == 200) {
    //   print('Customer deleted successfully!');
    // } else {
    //   print('Failed to delete customer. Error: ${response.statusCode}');
    // }

    return Get.toNamed(RouteNames.addPost);
  }

  Future? $onHoriz(String id) {
    bottomSheetController.toggleBottomSheet();
    bottomSheetController.id.value = id;
  }

  Function(String) $onTapMoreHoriz = (String id) {
    // bottomSheetController.toggleBottomSheet();
    // bottomSheetController.id.value = id;
    print(id);
  };

  // Future? $onTapMoreHoriz() {
  //   return Get.toNamed(RouteNames.addPost);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ContainerButtonProfile(
              text: 'Add Post',
              $addOnPressed: $addOnPressed,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var post = postAll[index];
              return CardWidgetBot(
                widget: Column(
                  children: [
                    PostAccountCard(
                      currentUser: postUser,
                      postUser: postUser,
                      getPosts: post,
                      $onTapAccount: $onTapAccount,
                      $onTapMoreHoriz: () async {
                        print(post.id);
                        bottomSheetController.toggleBottomSheet();
                        bottomSheetController.id.value = post.id;

                        // final response = await delete(
                        //   Uri.parse('${Endpoint.updatePost}/${post.id}'),
                        //   headers: Endpoint.$httpHeader,
                        //   body: jsonEncode(post.toJson()),
                        // );
                        //
                        //
                        // if (response.statusCode == 200) {
                        //   print('Customer deleted successfully!');
                        // } else {
                        //   print('Failed to delete customer. Error: ${response.statusCode}');
                        // }
                      },
                    ),
                    HomeMarkdown(
                      desc: post.desc,
                      $onButtonMore: $onButtonMore,
                    ),
                  ],
                ),
              );
            }, childCount: postAll.length),
          ),
        ],
      ),
    );
  }
}
