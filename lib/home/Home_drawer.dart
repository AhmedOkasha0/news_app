import 'package:flutter/material.dart';
import 'package:news_app/theme_app.dart';

class HomeDrawer extends StatelessWidget {
  Function onDrawerItemClick;
  HomeDrawer({required this.onDrawerItemClick});
  @override
  static const int category=1;
  static const int settings= 2;
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: screenSize.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(color: ThemeScreen.primaryColor),
            child: Center(
              child: Text(
                'News App !',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerItemClick(HomeDrawer.category);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.list,size: 35,),
                    Text('Category',style:Theme.of(context).textTheme.headline1,),
                ],
              ),
            ),
          ),
          SizedBox(height: 12,),

          InkWell(
            onTap: (){
              onDrawerItemClick(HomeDrawer.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 35,),
                  Text('Settings',style:Theme.of(context).textTheme.headline1,),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
