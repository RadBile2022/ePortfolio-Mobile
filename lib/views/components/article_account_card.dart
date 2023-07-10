import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticle.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:eportfolio_mobile/views/pages/PROFILEGetx.dart';
import 'package:flutter/material.dart';

class ArticleAccountCard extends StatelessWidget {
  /// Kartunya Akun Article
  final User articleUser;
  final User currentUser;
  final Article article;
  final GestureTapCallback $onTapAccount;
  final VoidCallback $onTapMoreHoriz;


  const ArticleAccountCard({
    super.key,
    required this.articleUser,
    required this.article,
    required this.$onTapAccount,
    required this.currentUser,
    required this.$onTapMoreHoriz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info section
          GestureDetector(
            onTap: $onTapAccount,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleRichWidget(
                        boldText: articleUser.username,
                        regularText: ' has written this',
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          SubTitleWidget(
                            data: article.createdAt == 'today'
                                ? 'Today .'
                                : articleUser.createdAt.toString(),
                          ),
                          if (!article.isPublic) const LockIcon12(),
                        ],
                      )
                    ],
                  ),
                ),
                if (article.userId == currentUser.id)
                  MoreHorizIcon24($onTapMoreHoriz: $onTapMoreHoriz)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
