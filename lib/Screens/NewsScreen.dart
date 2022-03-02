import 'package:flutter/material.dart';
import 'package:red_carpet_api/Ui_components/listsTilesUi.dart';
import 'package:red_carpet_api/apis_service/news_api.dart';
import 'package:red_carpet_api/model/news_article_modal.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: GestureDetector(
                onTap: () {
                  // playstore page or any function can be carried out
                  _launchURL();
                },
                child: Image.network(
                  'https://play-lh.googleusercontent.com/0ZLBnJdIsUbK5ZketGYY6HUbP_hbCAXBndJaGZVb-oKd_HJoZM1DDf4Vxt_nMRLYIiQV=s180-rw',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Text("Red Carpet News",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),

      //Call the APi services
      body: RefreshIndicator(
        onRefresh: () => client.getArticle(),
        child: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            //Check for response
            if (snapshot.hasData) {
              // list of articles
              List<Article> articles = snapshot.data;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) =>
                    customListTile(articles[index], context),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  _launchURL() async {
    final url =
        'https://play.google.com/store/apps/details?id=com.redcarpetup.rewardpay';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
