class Settings {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;

  Settings(
      {
        this.isGlutenFree=false,
        this.isVegetarian=false,
        this.isVegan=false,
        this.isLactoseFree=false
      }
      );
}