import 'package:flutter/material.dart';
import 'package:news_app/home/Category/items.dart';

class CategoryItem extends StatelessWidget {
  Items items;
  int index;
  CategoryItem(
      {
        required this.items,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(items.color),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(18),
            bottomLeft: Radius.circular((index % 2 == 0) ? 18 : 0),
            bottomRight: Radius.circular((index % 2 == 0) ? 0 : 18)),
      ),
      child: Column(
        children: [
          Image.asset(items.imagePath),
          Text(items.title),

        ],
      ),
    );
  }
}
