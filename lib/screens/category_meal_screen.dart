import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routName = '/meal-screen';
  final List<Meal> filterData;
  CategoryMealScreen(this.filterData);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  Map rtArg;
  List<Meal> chosenMeals;

  @override
  void didChangeDependencies() {
    rtArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    chosenMeals = widget.filterData.where(
      (meal) {
        return meal.categories.contains(rtArg['id']);
      },
    ).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          rtArg['title'],
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ct, index) {
            return MealItem(
              id: chosenMeals[index].id,
              affordability: chosenMeals[index].affordability,
              complexity: chosenMeals[index].complexity,
              duration: chosenMeals[index].duration,
              imgUrl: chosenMeals[index].imageUrl,
              title: chosenMeals[index].title,
            );
          },
          itemCount: chosenMeals.length,
        ),
      ),
    );
  }
}
