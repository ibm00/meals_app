import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = '/filter-screen';
  final Function filterMeals;
  FilterScreen(this.filterMeals, this.switchValues);
  final Map<String, bool> switchValues;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.switchValues['glutenFree'];
    _vegan = widget.switchValues['vegan'];
    _vegetarian = widget.switchValues['vegetarian'];
    _lactoseFree = widget.switchValues['lactoseFree'];
    super.initState();
  }

  SwitchListTile buildSwitchListTile(
      String title, String subTitle, bool filter, Function changeValue) {
    return SwitchListTile(
      value: filter,
      onChanged: changeValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.filterMeals(
              {
                'glutenFree': _glutenFree,
                'vegetarian': _vegetarian,
                'lactoseFree': _lactoseFree,
                'vegan': _vegan,
              },
            ),
          )
        ],
        title: Text('Filters'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 50,
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 24),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .7,
              child: Column(
                children: [
                  buildSwitchListTile(
                    'Gluten-Free',
                    'Only include Gluten-Free meals',
                    _glutenFree,
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Lactose-Free',
                    'Only include Lactose-Free meals',
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegetarian',
                    'Only include Vegetarian meals',
                    _vegetarian,
                    (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegan',
                    'Only include Vegan meals',
                    _vegan,
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
