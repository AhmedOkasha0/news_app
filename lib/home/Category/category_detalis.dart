import 'package:flutter/material.dart';
import 'package:news_app/api_manger.dart';
import 'package:news_app/home/Category/items.dart';
import 'package:news_app/home/Category/tab_contanier.dart';
import 'package:news_app/model/sourcesResponce.dart';
import 'package:news_app/theme_app.dart';

class CategoryDetalis extends StatelessWidget {
  Items items;
  CategoryDetalis({required this.items});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponce>(
        future: ApiManger.getSources(items.id),
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
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
                ElevatedButton(onPressed: () {}, child: Text('Refresh')),
              ],
            );
          }
          var sourcesList = snapshot.data?.sources ?? [];
          print(sourcesList);
          return TabContanier(sourceList:sourcesList);
        });
  }
}
