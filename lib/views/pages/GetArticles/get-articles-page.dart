import 'package:eportfolio_mobile/controllers/api/endpoint.dart';
import 'package:eportfolio_mobile/routes/route_names.dart';
import 'package:eportfolio_mobile/views/components/article_account_card.dart';
import 'package:eportfolio_mobile/views/components/article_title_container.dart';
import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/drop_down.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/components/home_markdown.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetArticlesCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetPosts/GetPostsCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Btn_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/Card_Cpn_About.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class ArticlesTab extends StatelessWidget {
  final bottomSheetController = Get.find<BottomSheetController>();

  final GetUser currentUser;
  final GetUser articleUser;
  final List<dynamic> getArticlesAll;

  ArticlesTab({
    super.key,
    required this.currentUser,
    required this.articleUser,
    required this.getArticlesAll,
  });

  final GestureTapCallback $onTapAccount = () {
    print('halo');
  };
  PopupMenuItemSelected? $onTapMore(String result)  {
    print('hai');
    return null;
  }
  final VoidCallback $onButtonMore = () {
    print('asdfkjdsaf');
  };

  Future? $addOnPressed() {
    return Get.toNamed(RouteNames.addPost);
  }

  Future?  $onTapMoreHoriz  () {
    bottomSheetController.toggleBottomSheet();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 20,
            flexibleSpace: FlexibleSpaceBar(
              background: ProfileElevatedButton(
                text: 'Add Post',
               $addOnPressed: () {  },
              ),
            ),
          ),
        ],
        body: ListView.builder(
          itemCount: getArticlesAll.length,
          itemBuilder: (context, index) {
            var getArticles = getArticlesAll[index];
            return CardWidget(
              widget: Column(
                children: [
                  ArticleAccountCard(currentUser:
                    currentUser,
                    articleUser: articleUser,
                    getArticles: getArticles,
                   $onTapAccount: () {  },
                    $onTapMoreHoriz: $onTapMoreHoriz,

                  ),
                  ArticleTitleContainer(
                    getArticles: getArticles,
                  ),
                  HomeMarkdown(
                    desc: getArticles.desc,
                    $onButtonMore: () {  },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
