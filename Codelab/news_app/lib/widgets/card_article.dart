import 'package:flutter/material.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:provider/provider.dart';

import '../common/navigation.dart';
import '../data/model/article.dart';
import '../screen/article_detail_screen.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder:
          (BuildContext context, DatabaseProvider provider, Widget? child) {
        return FutureBuilder(
            future: provider.isBookmarked(article.url),
            builder: (context, snapshot) {
              var isBookmarked = snapshot.data ?? false;
              return Material(
                color: primaryColor,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
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
                  onTap: () => Navigation.intentWithData(
                      ArticleDetailPage.routeName, article),
                  trailing: isBookmarked
                      ? IconButton(
                    icon: const Icon(Icons.bookmark),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () => provider.removeBookmark(article.url),
                  )
                      : IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () => provider.addBookmark(article),
                  ),

                ),
              );
            });
      },
    );
  }
}
