import 'package:flutter/material.dart';
import 'package:news_app/common/styles.dart';

import '../data/model/article.dart';
import '../screen/article_detail_screen.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage ?? "",
          child: article.urlToImage == null
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Icon(Icons.question_mark),
                )
              : Image.network(
                  article.urlToImage!,
                  width: 100,
                ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author ?? ""),
        onTap: () => Navigator.pushNamed(
          context,
          ArticleDetailPage.routeName,
          arguments: article,
        ),
      ),
    );
  }
}
