import 'package:flutter/material.dart';
import 'package:meals/components/menu_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';

import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeals;

  const TabsScreen(this.favoritesMeals);
  @override
  _TabsCreenState createState() => _TabsCreenState();
}

class _TabsCreenState extends State<TabsScreen> {



  int _selectedScreenIndex = 0;

  /*primeira versão: Ficou descontinuada para que se pudesse fazer a troca do nome
  que aparece no Scaffold de acordo com a tab selecionada. Para nova versão
  a lista precisou ser modificada para comportar essa mudança
   List<Widget> _screens=[
    CategoriesScreen(),
    FavoriteScreen()
  ];*/

  List<Map<String, Object>> _screens;


  @override
  void initState() {
    super.initState();
    _screens =[
      //referente ao primeiro bar:
      {
        "title" : "Lista de Categorias",
        "screen" : CategoriesScreen()
      },
      //referente ao segundo bar:
      {
        "title": "Meus Favoritos",
        "screen" : FavoriteScreen(widget.favoritesMeals)
      }
    ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]["title"]
        ),
      ),
      //Drawer
      drawer: MenuDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        //definição das propriedades da barra
        //cor de fundo
        backgroundColor: Theme.of(context).primaryColor,
        //cor do item não selecionado
        unselectedItemColor: Colors.white,
        //cor do item selecionado
        selectedItemColor: Theme.of(context).accentColor,
        //propriedade para o app saber qual dos Bar Item está selecionado
        currentIndex: _selectedScreenIndex,
        //tipo do BottomNavigationBar
        /*aqui existe dois tipo o tipo fixed, e o tipo shifting
        * fixed = torna o navigator bar fixo
        * shifting = cria uma leve animação ao navegar entre as barras. Obs:
        * No caso do shifting, a cor de fundo precisa ser colocada diretamente
        * no BottomNavigationBatItem ao invés de ficar no componente BottomNavigationBar*/
        //type: BottomNavigationBarType.shifting,
        type: BottomNavigationBarType.fixed,
        //ação
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text("Categorias"),
            //teste de cor usando a propriedade shifting. Line 50
            //backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Favoritos"),
            //teste de cor usando a propriedade shifting. Line 50
            //backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
