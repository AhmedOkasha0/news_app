import 'package:flutter/material.dart';
import 'package:news_app/home/Category/category_items.dart';
import 'package:news_app/home/Category/items.dart';

class CategoryFragment extends StatelessWidget {
  var categoryList = Items.getCategory();
  Function onCategoryItem;
  CategoryFragment({required this.onCategoryItem});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit:StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'assets/images/back_ground.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Pick your category\n of interest',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 18,
                        crossAxisSpacing: 18,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            onCategoryItem(categoryList[index]);
                          },
                          child: CategoryItem(
                            index: index,
                            items: categoryList[index],
                          ),
                        );
                      },
                      itemCount: categoryList.length),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
