import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Column buildListTile(String lable, IconData icon, Function onClicked) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            icon,
            size: 26,
          ),
          title: Text(
            lable,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          onTap: onClicked,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 150,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                letterSpacing: 1,
                fontSize: 36,
                fontWeight: FontWeight.w900,
                fontFamily: 'RobotoCondensed',
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filter',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
            },
          ),
        ],
      ),
    );
  }
}
