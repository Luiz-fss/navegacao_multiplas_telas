import 'package:flutter/material.dart';
import 'package:meals/components/Meal_Item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {


  final List<Meal> meals;
  CategoriesMealsScreen(this.meals);

/*
  final Category category;
  CategoriesMealsScreen(this.category);
 */
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where((meal){
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index){
          return MealItem(categoryMeals[index]);
        },
      ),
    );
  }
}
