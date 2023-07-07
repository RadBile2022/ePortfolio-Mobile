import 'package:eportfolio_mobile/views/components/cores/text_widget.dart';
import 'package:eportfolio_mobile/views/components/icons/lock_icon.dart';
import 'package:eportfolio_mobile/views/components/icons/more_horitz_icon.dart';
import 'package:eportfolio_mobile/views/pages/GetArticles/GetxArticle.dart';
import 'package:flutter/material.dart';

class ArticleTitleContainer extends StatelessWidget {
  /// Kartunya Akun Article
  final Article getArticles;

  const ArticleTitleContainer({
    super.key,
    required this.getArticles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Text(
            getArticles.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          if (getArticles.coverArticle != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(getArticles.coverArticle),
            ),
        ],
      ),
    );
  }
}
