import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:todoapp/core/models/article_model.dart';

class ArticleRepository {
  Dio dio = Dio();

  Future<ArticleModel> getArticles() async {
    log('WORKED HERE');
    var response = await dio.get(
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=cd99d2feee2b43d18c49f2da40bc3b29');
    return articleModelFromJson(jsonEncode(response.data));
  }
}
