import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/post_account_card.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/HOME.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class PostsTab extends StatelessWidget {
  final GetUser postUser;
  final List<dynamic> getPostsAll;

  PostsTab({super.key, required this.postUser, required this.getPostsAll});

  final GestureTapCallback $onTapAccount = () {
    print('halo');
  };
  final GestureTapCallback $onTapMore = () {
    print('hai');
  };
  final VoidCallback $onButtonMore = () {
    print('asdfkjdsaf');
  };

  Future? $addOnPressed() {
    return Get.toNamed(RouteNames.addPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: ProfileElevatedButton(
              text: 'Add Post ',
              $addOnPressed: $addOnPressed,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getPostsAll.length,
              itemBuilder: (context, index) {
                var getPosts = getPostsAll[index];
                return CardWidget(
                  widget: Column(
                    children: [
                      PostAccountCard(
                        currentUser: postUser,
                        postUser: postUser,
                        getPosts: getPosts,
                        $onTapAccount: $onTapAccount,
                        $onTapMore: $onTapMore,
                      ),
                      HomeMarkdown(
                        desc: getPosts.desc,
                        $onButtonMore: $onButtonMore,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
