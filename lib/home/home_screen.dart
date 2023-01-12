import 'package:flutter/material.dart';
import 'package:news_app/home/Category/Category_screen.dart';
import 'package:news_app/home/Category/Settings_tab.dart';
import 'package:news_app/home/Category/category_detalis.dart';
import 'package:news_app/home/Category/category_items.dart';
import 'package:news_app/home/Category/items.dart';
import 'package:news_app/home/Category/tab_contanier.dart';
import 'package:news_app/home/Home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'New App',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
          ),
          body:selectedItemDrawer == HomeDrawer.settings ?
              SettingsTab():
          selectedCategory == null?
              CategoryFragment(onCategoryItem: onCategoryItem):
          CategoryDetalis(items: selectedCategory!),
      ),
    );
  }

  Items? selectedCategory = null;

  onCategoryItem(Items items) {
    selectedCategory = items ;
    setState(() {});
  }
  var selectedItemDrawer=HomeDrawer.category;
  void onDrawerItemClick(int selectedItem){
    selectedItemDrawer= selectedItem;
    Navigator.pop(context);
    selectedCategory =null;
    setState(() {

    });


  }
}
