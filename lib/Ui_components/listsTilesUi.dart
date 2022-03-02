import 'package:flutter/material.dart';
import 'package:red_carpet_api/NewsPage/news_detail.dart';
import 'package:red_carpet_api/model/news_article_modal.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      print(article.url);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             Color(0xDD285D),
             Colors.white
           ]
         ),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(

              image: DecorationImage(
                  image:   NetworkImage(article.urlToImage != null ? article.urlToImage : 'https://images.pexels.com/photos/3794188/pexels-photo-3794188.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.source.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.grey[800]
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
           article.author.toString() != 'null' ? article.author.toString() : "Anonymous",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
              color: Colors.white
            ),
          )
        ],
      ),
    ),
  );
}