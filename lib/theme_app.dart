import 'package:flutter/material.dart';

class ThemeScreen {
  static Color primaryColor = Color(0xff39A552);
  static ThemeData themeLight = ThemeData(

      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Color(0xff39A552),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30),),
        ),

      ),
      textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
            headline2: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,

            ),
        headline3: TextStyle(
          color: Colors.white,
          fontSize: 22,

        ),
      )

  );
}