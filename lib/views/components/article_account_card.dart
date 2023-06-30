import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetArticlesCtrl.dart';
import 'package:eportfolio_mobile/views/pages/GetUser/GetUserCtrl.dart';
import 'package:flutter/material.dart';

class ArticleAccountCard extends StatelessWidget {
  /// Kartunya Akun Article
  final GetUser articleUser;
  final GetUser currentUser;
  final GetArticles getArticles;
  final GestureTapCallback $onTapAccount;
  final GestureTapCallback $onTapMore;

  const ArticleAccountCard({
    super.key,
    required this.articleUser,
    required this.getArticles,
    required this.$onTapAccount,
    required this.$onTapMore,
    required this.currentUser,
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
                            data: getArticles.createdAt == 'today'
                                ? 'Today .'
                                : articleUser.createdAt.toString(),
                          ),
                          if (!getArticles.isPublic) const LockIcon12(),
                        ],
                      )
                    ],
                  ),
                ),
                if (getArticles.userId == currentUser.id)
                  InkWell(
                    onTap: $onTapMore,
                    child: const MoreHorizIcon24(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
