import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';

import '../data/api/api_service.dart';
import '../utils/result_state.dart';


class NewsProvider extends ChangeNotifier {
  final ApiService apiService;

  NewsProvider({required this.apiService}) {
    _fetchAllArticle();
  }

  late ArticleResult _articleResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  ArticleResult get result => _articleResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllArticle() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final article = await apiService.topHeadlines();
      if (article.articles.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "Empty data";
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _articleResult = article;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error --> $e";
    }

  }
}