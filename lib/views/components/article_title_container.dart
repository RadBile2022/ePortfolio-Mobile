
import 'package:eportfolio_mobile/views/pages/ContentArticle/GetxArticle.dart';
import 'package:flutter/material.dart';

class ArticleTitleContainer extends StatelessWidget {
  /// Kartunya Akun Article
  final Article article;

  const ArticleTitleContainer({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Column(
        children: [
          Text(
            article.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 12),
          if (article.coverArticle != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(article.coverArticle),
            ),
        ],
      ),
    );
  }
}
