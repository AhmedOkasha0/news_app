import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home/Category/news_detalis_screen.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/model/NewsRewsponse.dart';
import 'package:news_app/theme_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routName,
      routes: {
        HomeScreen.routName: (context) => HomeScreen(),
        NewsDetalisScreen.routeName : (context)=> NewsDetalisScreen(),
      },
      theme: ThemeScreen.themeLight,
    );
  }
}
