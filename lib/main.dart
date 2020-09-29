import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/util/app_routes.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';

import 'models/meal.dart';

void main ()=>runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();

  List<Meal> favoriteMeals = [];

  List<Meal> _avaibleMeals = DUMMY_MEALS;
  void _filterMeals(Settings setting){

    setState((){
      setting = settings;
      _avaibleMeals = DUMMY_MEALS.where((meal){
        final filterGluten = setting.isGlutenFree &&  !meal.isGlutenFree;
        final filterLactose = setting.isLactoseFree &&  !meal.isLactoseFree;
        final filterVegan = setting.isVegan &&  !meal.isVegan;
        final filterVegetarian = setting.isVegetarian &&  !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;


      }).toList();
    });
  }

  void _toggleFavorite(Meal meal){
    setState(() {
      favoriteMeals.contains(meal) ? favoriteMeals.remove(meal) : favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal){
    return favoriteMeals.contains(meal);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: TabsCreen(),
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: "Raleway",
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed"
            )
        ),
      ),
      debugShowCheckedModeBanner: false,
      //definindo rotas
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_avaibleMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite,isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings,_filterMeals),
      },


    );
  }


}
