import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/home/Category/news_items.dart';
import 'package:news_app/home/Category/tab_contanier.dart';
import 'package:news_app/model/NewsRewsponse.dart';
import 'package:news_app/model/sourcesResponce.dart';
import 'package:news_app/theme_app.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(onPressed: (){
        showResults(context);
      }, icon: Icon(Icons.search,size: 25,))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.of(context).pop();
    }, icon: Icon(Icons.clear,size: 24,));

  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsRewsponse>(
      future: ApiManger.getNews(searchKeyword: query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'suggestions'
      ),
    );
  }

}