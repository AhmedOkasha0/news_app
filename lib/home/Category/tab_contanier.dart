import 'package:flutter/material.dart';
import 'package:news_app/home/Category/new_contanier.dart';
import 'package:news_app/home/Category/tab_icon.dart';
import 'package:news_app/model/sourcesResponce.dart';

class TabContanier extends StatefulWidget {
  List<Source> sourceList;
  TabContanier({required this.sourceList});

  @override
  State<TabContanier> createState() => _TabContanierState();
}

class _TabContanierState extends State<TabContanier> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourceList
                  .map((source) => TabItems(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source)))
                  .toList()),
          Expanded(
              child: NewsContanier(source: widget.sourceList[selectedIndex])
          ),
        ],
      ),
    );
  }
}
