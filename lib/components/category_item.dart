import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/util/app_routes.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final Category category;
  CategoryItem(this.category);

  void _selectCategory(BuildContext context){
   /* Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CategoriesMealsScreen(category))
    );
    */
   Navigator.of(context).pushNamed(AppRoutes.CATEGORIES_MEALS,arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
      ),
    );
  }
}
