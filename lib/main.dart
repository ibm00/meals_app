import 'dart:ui';

import 'package:flutter/material.dart';

import './data/dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detals.dart';
import './screens/tabs_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> favouriteMealList = [];
  List<Meal> filteredmealList = DUMMY_MEALS;
  Map<String, bool> _filterDate = {
    'glutenFree': false,
    'vegetarian': false,
    'lactoseFree': false,
    'vegan': false,
  };

  void setFilters(Map<String, bool> filterDate) {
    setState(() {
      _filterDate = filterDate;
      filteredmealList = DUMMY_MEALS.where((meal) {
        if (!meal.isGlutenFree && _filterDate['glutenFree']) return false;
        if (!meal.isLactoseFree && _filterDate['lactoseFree']) return false;
        if (!meal.isVegan && _filterDate['vegan']) return false;
        if (!meal.isVegetarian && _filterDate['vegetarian']) return false;

        return true;
      }).toList();
    });
  }

  bool isFavouriteIndicator(String id) {
    return favouriteMealList.any((element) => element.id == id);
  }

  void updateFavourits(String id) {
    var mealIndex = favouriteMealList.indexWhere((meal) => meal.id == id);
    if (mealIndex >= 0) {
      setState(() {
        favouriteMealList.removeAt(mealIndex);
      });
    } else {
      setState(() {
        favouriteMealList.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == id),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      title: 'DeliMeals',
      routes: {
        '/': (_) => TabBarScreen(favouriteMealList),
        CategoryMealScreen.routName: (_) =>
            CategoryMealScreen(filteredmealList),
        MealDetalsScreen.routName: (_) =>
            MealDetalsScreen(updateFavourits, isFavouriteIndicator),
        FilterScreen.routName: (_) => FilterScreen(setFilters, _filterDate),
      },
    );
  }
}
