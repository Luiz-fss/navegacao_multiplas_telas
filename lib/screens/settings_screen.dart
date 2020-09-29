import 'package:flutter/material.dart';
import 'package:meals/components/menu_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.settings,this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {



  Settings settings;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(String title, String subTitle, bool value, Function(bool) onChanged){
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTitle),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
                "Configurações",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                    "Sem glútem",
                    "Só exibe refeições sem glútem",
                    settings.isGlutenFree,
                    (valor){
                      setState(() {
                        settings.isGlutenFree = valor;
                      });
                    }
                ),
                _createSwitch(
                    "Sem lactose",
                    "Só exibe refeições sem lactose",
                    settings.isLactoseFree,
                        (valor){
                      setState(() {
                        settings.isLactoseFree = valor;
                      });
                    }
                ),
                _createSwitch(
                    "Sem glútem",
                    "Só exibe refeições sem glútem",
                    settings.isGlutenFree,
                        (valor){
                      setState(() {
                        settings.isGlutenFree = valor;
                      });
                    }
                ),
                _createSwitch(
                    "Vegana",
                    "Só exibe refeições Veganas",
                    settings.isVegan,
                        (valor){
                      setState(() {
                        settings.isVegan = valor;
                      });
                    }
                ),
                _createSwitch(
                    "Vegetariana",
                    "Vegetariana",
                    settings.isVegetarian,
                        (valor){
                      setState(() {
                        settings.isVegetarian = valor;
                      });
                    }
                )
              ],
            ),
          )
        ],
      ),
      drawer: MenuDrawer(),
    );
  }
}
