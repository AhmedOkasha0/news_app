import 'package:flutter/material.dart';
import 'package:news_app/model/NewsRewsponse.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetalisScreen extends StatelessWidget {
  static const String routeName = 'newsDetalis';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text('News Title'),
      ),
      body: Container(
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
            SizedBox(
              height: 5,
            ),
            Text(
              news.title ?? '',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            Text(
              news.content ?? '',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Text(news.publishedAt ?? ''),
            Text(news.description ?? ''),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               TextButton(onPressed: (){
                 openUrl(news.url);
               }, child: Text('View Full Article')),
                Icon(Icons.arrow_forward_ios,color: Colors.black,),
              ],
            )
          ],
        ),
      ),
    );
  }
  void openUrl(String? Url)async{
    if(Url == null){
      return ;
  }
    var uri = Uri.parse(Url);
   if(await canLaunchUrl(uri)){
     await launchUrl(uri);
   }

}
}
