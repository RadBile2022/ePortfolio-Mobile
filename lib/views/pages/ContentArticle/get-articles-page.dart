import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/article_account_card.dart';
import 'package:eportfolio_mobile/views/components/article_title_container.dart';
import 'package:eportfolio_mobile/views/components/modal-bottom-sheet.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/components/profile-containers.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticleController.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/get-user-page.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesTabPage extends StatelessWidget {
  final articleController = Get.find<ArticleController>();

  final bottomSheetController = Get.find<BottomSheetController>();
  final profilePageController = Get.find<ProfilePageController>();

  // final GetUser currentUser;
  final User articleUser;
  final List<dynamic> articleAll;

  ArticlesTabPage({
    super.key,
    required this.articleUser,
    required this.articleAll,
  });

  final GestureTapCallback $onTapAccount = () {
    print('halo');
  };

  PopupMenuItemSelected? $onTapMore(String result) {
    print('hai');
    return null;
  }

  final VoidCallback $onButtonMore = () {
    print('asdfkjdsaf');
  };

  Future? $addOnPressed() {
    return Get.toNamed(RouteNames.addArticle);
  }

  Future? $onTapMoreHoriz() {
    // bottomSheetController.toggleBottomSheet();
  }

  Future? $onTapEditHoriz(BuildContext context, String id) {
    Navigator.pop(context);
    Get.toNamed(RouteNames.editArticle, arguments: id);

  }

  Future? $onTapDeleteHoriz(BuildContext context, Article t) {
    articleController.deleteArticle(t.id);
    Navigator.pop(context);
    // print(id);
    // postController.deletePost(id);
    // await postController.removePost(id);
    // await postController.removePost(id);
  }

  @override
  Widget build(BuildContext context) {
    articleController.readData();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ContainerButtonProfile(
              text: 'Add Articles',
              $addOnPressed: $addOnPressed,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              var article = articleAll[index];
              return CardWidgetBot(
                widget: Column(
                  children: [
                    ArticleAccountCard(
                      currentUser: articleUser,
                      articleUser: articleUser,
                      article: article,
                      $onTapAccount: () {},
                      $onTapMoreHoriz: () {
                        ModalBottomSheetHoriz.show(
                          context,
                          ()=> $onTapEditHoriz(context, article.id),
                          () => $onTapDeleteHoriz(context, article),
                        );
                      },
                    ),
                    ArticleTitleContainer(
                      article: article,
                    ),
                    HomeMarkdown(
                      desc: article.desc,
                      $onButtonMore: () {},
                    ),
                  ],
                ),
              );
            }, childCount: articleAll.length),
          ),
        ],
      ),
    );
  }
}
