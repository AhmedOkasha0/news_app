import 'package:flutter/material.dart';
import 'package:news_app/model/sourcesResponce.dart';
import 'package:news_app/theme_app.dart';

class TabItems extends StatelessWidget {
Source source;
bool isSelected;
TabItems({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal:25 ),
      margin: EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: isSelected == true ? ThemeScreen.primaryColor: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: ThemeScreen.primaryColor),
      ),
      child: Text(source.name?? '',
      style: TextStyle(
        fontSize: 18,
        color: isSelected == true ? Colors.white : ThemeScreen.primaryColor
      ),
      ),


    );
  }
}
