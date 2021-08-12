import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './category_screen.dart';
import './favourite_screen.dart';
import '../models/meal.dart';

class TabBarScreen extends StatefulWidget {
  final List<Meal> updatedFavouriteMealList;
  TabBarScreen(this.updatedFavouriteMealList);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List<Meal> favouriteMealList = [];
  List<Map<String, Object>> _screensList;
  @override
  void initState() {
    _screensList = [
      {
        'page': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(widget.updatedFavouriteMealList),
        'title': 'My Favourites',
      }
    ];
    super.initState();
  }

  int _currentIndex = 0;
  void _selectedItemIndex(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screensList[_currentIndex]['title']),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        onTap: _selectedItemIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _screensList[_currentIndex]['page'],
    );
  }
}
