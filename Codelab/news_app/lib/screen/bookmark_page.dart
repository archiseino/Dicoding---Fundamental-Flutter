import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/utils/result_state.dart';
import 'package:news_app/widgets/platform_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/card_article.dart';

class BookmarksPage extends StatelessWidget {
  static String bookmarksTitle = "Bookmarks";

  const BookmarksPage({super.key});

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bookmark Page"),
      ),
      body: _buildList(),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Bookmark Page"),
        ),
        child: _buildList()
    );
  }

  Widget _buildList() {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      if (provider.state == ResultState.hasData) {
        return ListView.builder(
            itemCount: provider.bookmarks.length,
            itemBuilder: (context, index) {
              return CardArticle(article: provider.bookmarks[index]);
            });
      } else {
        return Center(
            child: Material(
            child: Text(provider.message)
          ),
        );
      }
    },

    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }
}
