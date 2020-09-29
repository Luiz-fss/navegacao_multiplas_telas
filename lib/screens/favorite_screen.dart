import 'package:flutter/material.dart';
import 'package:meals/components/Meal_Item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatelessWidget {

  List<Meal> favoriteMeals = [];
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("Nenhuma comida favorita"),
      );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index){
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
