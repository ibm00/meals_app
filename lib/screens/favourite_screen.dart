import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> updatedFavouriteMealList;
  FavouriteScreen(this.updatedFavouriteMealList);

  @override
  Widget build(BuildContext context) {
    return (updatedFavouriteMealList.isEmpty)
        ? Center(
            child: Text(
              '"There is no favourite meals yet"',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          )
        : ListView.builder(
            itemBuilder: (ct, index) {
              return MealItem(
                id: updatedFavouriteMealList[index].id,
                affordability: updatedFavouriteMealList[index].affordability,
                complexity: updatedFavouriteMealList[index].complexity,
                duration: updatedFavouriteMealList[index].duration,
                imgUrl: updatedFavouriteMealList[index].imageUrl,
                title: updatedFavouriteMealList[index].title,
              );
            },
            itemCount: updatedFavouriteMealList.length,
          );
  }
}
