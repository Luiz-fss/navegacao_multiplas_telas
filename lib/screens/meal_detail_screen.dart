import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {

  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;
  const MealDetailScreen(this.onToggleFavorite,this.isFavorite);


  @override
  Widget build(BuildContext context) {

    Widget _createSectionTitle(BuildContext context, String title){
      return
        //titulo da sessão
         Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
        );
    }

    final meal = ModalRoute.of(context).settings.arguments as Meal;

    _createSectionContainer(Widget child){
      return  Container(
        width: 300,
        height: 200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)
        ),
        child: child
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //imagem no topo da tela
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl,fit: BoxFit.cover,),
            ),

            _createSectionTitle(context, "Ingredientes"),

            //lista de igredientes
            _createSectionContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        child: Text(
                          meal.ingredients[index],
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  }
              ),
            ),

            //titulo dos passos
            _createSectionTitle(context, "Passos"),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                  itemBuilder: (context,index){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(
                          meal.steps[index]
                        ),
                      ),
                      Divider()
                    ],
                  );
                  },
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(meal) ? Icons.star : Icons.star_border
        ),
        onPressed: (){
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
