import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/util/app_routes.dart';

class MealItem extends StatelessWidget {

  final Meal meal;
  const MealItem(this.meal);

  void _selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.MEAL_DETAIL,arguments: meal).then((result){});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(meal.imageUrl, height: 250,width: double.infinity,fit: BoxFit.cover,),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black45, 
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 20
                    ),
                    child: Text(
                        meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                      ),
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //1 elemento
                      Icon(Icons.schedule),
                      //2 elementos
                      SizedBox(width: 6,),
                      //3 elemento
                      Text("${meal.duration} min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //1 elemento
                      Icon(Icons.work),
                      //2 elementos
                      SizedBox(width: 6,),
                      //3 elemento
                      Text(meal.complexityText)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      //1 elemento
                      Icon(Icons.attach_money),
                      //2 elementos
                      SizedBox(width: 6,),
                      //3 elemento
                      Text(meal.costText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
