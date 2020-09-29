import 'package:flutter/cupertino.dart';

enum Complexity{SIMPLE, MEDIUM, DIFFICULT}

enum Cost {CHEAP, FAIR,EXPANSIVE}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal ({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.complexity,
    @required this.cost
  });

  //pegando o valor textual associado a cada um dos valores da enumeração

  String get complexityText{
    switch(complexity){
      case Complexity.SIMPLE:
        return "Simples";
      case Complexity.MEDIUM:
        return "Normal";
      case Complexity.DIFFICULT:
        return "Difícil";
      default:
        return "Complexidade desconhecida";
    }
  }

  String get costText{
    switch(cost){
      case Cost.CHEAP:
        return "Barato";
      case Cost.FAIR:
        return "Justo";
      case Cost.EXPANSIVE:
        return "Caro";
      default:
        return "Custo desconhecida";
    }
  }


}