import 'dart:ui';

class FruitsCategory{
  final String name;
  final Color color;

  FruitsCategory({this.name, this.color});


}


class FruitsCategoryList{
   final List<String> images;
   final List<FruitsCategory>fruitsCategory;


   FruitsCategoryList({this.fruitsCategory,this.images});


}

final FruitsCategoryList  fruitsCategoryList = new FruitsCategoryList(
   images: [
     'assets/images/banana.jpg',
     'assets/images/brownGlass.jpg',
     'assets/images/grape.jpg',
     'assets/images/lemon.jpg',
     'assets/images/madarine.jpg',
     'assets/images/papaye.jpg',
     'assets/images/pineapple.jpg',
     'assets/images/smoothy.jpg',
     'assets/images/strawcock.jpg',
     'assets/images/strawMilk.jpg',
     'assets/images/strawmilk1.jpg',
     'assets/images/strawmilk2.jpg',
   ],
  fruitsCategory: [
    FruitsCategory(
        name: "Fruits",
        color:  Color(0xFFF1AF27)


    ),
    FruitsCategory(
        name: "Cocktails",
        color:  Color(0xFFEF5964)


    ),
    FruitsCategory(
        name: "Smoothies",
        color:  Color(0xFFDCB4E7)


    ),
    FruitsCategory(
        name: "Photography",
        color:  Color(0xFF8943A1)


    ),

    FruitsCategory(
        name: "Fresh",
        color:  Color(0xFFFF7350)


    ),
    FruitsCategory(
        name: "Latest",
        color:  Color(0xFF1478B2)


    ),
    FruitsCategory(
        name: "New",
        color:  Color(0xFFBD4982)


    ),

  ]
);