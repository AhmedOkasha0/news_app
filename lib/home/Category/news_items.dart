import 'package:flutter/material.dart';
import 'package:news_app/home/Category/news_detalis_screen.dart';
import 'package:news_app/model/NewsRewsponse.dart';

class NewsItems extends StatelessWidget {
News news;
NewsItems({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.of(context).pushNamed(NewsDetalisScreen.routeName,arguments: news),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
              ),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(height: 5,),
            Text(news.title ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,

            ),
            ),
            Text(news.content ?? '',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,

              ),
            ),

            Text(news.publishedAt ?? ''),




          ],
        ),
      ),
    );
  }
}
