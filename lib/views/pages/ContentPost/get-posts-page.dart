import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/modal-bottom-sheet.dart';
import 'package:eportfolio_mobile/views/components/post_account_card.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/pages/ContentPost/GetxPostController.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsTabPage extends StatelessWidget {
  final bottomSheetController = Get.find<BottomSheetController>();
  final postController = Get.find<PostController>();

  final User postUser;
  final List<dynamic> postAll;

  PostsTabPage({
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

  Future? $onTapEditHoriz(BuildContext context, String id) {
    Navigator.pop(context);

    Get.toNamed(RouteNames.editPost, arguments: id);
  }

  void $onTapDeleteHoriz(BuildContext context, String id) {
    // print(id);
    postController.deletePost(id);

    Navigator.pop(context);
    // await postController.removePost(id);
    // await postController.removePost(id);
  }

  @override
  Widget build(BuildContext context) {
    postController.readData();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CardWidgetX(
              widget: Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Postingan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: $addOnPressed,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                'https://api-portfolio.gft.academy/storage/images/profilePicture_1675396879415.jpg',
                                width: 55,
                                height: 55,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 16),
                              width: 250,
                              child: Text(
                                'Apa yang Anda Pikirkan ?',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Icon(
                                Icons.photo_library_rounded,
                                size: 26,
                                color: Colors.green,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
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
                      post: post,
                      $onTapAccount: $onTapAccount,
                      $onTapMoreHoriz: () async {
                        ModalBottomSheetHoriz.show(
                          context,
                          () => $onTapEditHoriz(context, post.id),
                          () => $onTapDeleteHoriz(context, post.id),
                        );

                        print(post.id);
                        bottomSheetController.toggleBottomSheet();
                        bottomSheetController.id.value = post.id;

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
