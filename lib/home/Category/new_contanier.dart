import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/home/Category/news_items.dart';
import 'package:news_app/model/NewsRewsponse.dart';
import 'package:news_app/model/sourcesResponce.dart';
import 'package:news_app/theme_app.dart';

class NewsContanier extends StatelessWidget {
  Source source;
  NewsContanier({required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsRewsponse>(
      future: ApiManger.getNews(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: ThemeScreen.primaryColor,
          ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('something went wrong'),
              ElevatedButton(onPressed: () {}, child: Text('Refresh')),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('reload')),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItems(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
