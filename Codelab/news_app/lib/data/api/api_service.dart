import 'dart:convert';

import '../model/article.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =  "https://newsapi.org/v2/";
  static const String _apiKey = "Your-Api-Key";
  static const String _category = 'business';
  static const String _country = 'us';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      print("Success Invoke Call");
      return ArticleResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}