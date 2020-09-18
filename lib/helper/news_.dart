import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articles_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=ng&category=general&apiKey=738c0860d8ea42fa824cb54395c26aec';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            // publishedAt: element['publishedAt'],
            content: element['context'],
          );

          news.add(articleModel);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> categoryNews = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=ng&category=$category&apiKey=$apiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element['url'],
            // publishedAt: element['publishedAt'],
            content: element['context'],
          );

          categoryNews.add(articleModel);
        }
      });
    }
  }
}

//apikey:
const apiKey = '738c0860d8ea42fa824cb54395c26aec';
