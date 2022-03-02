import 'dart:convert';

import 'package:http/http.dart';
import 'package:red_carpet_api/model/news_article_modal.dart';



class ApiService {
  
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c819757b554c41baa4d39b80c32d2fa9";

  

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}