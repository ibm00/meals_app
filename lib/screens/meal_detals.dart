import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetalsScreen extends StatefulWidget {
  static const routName = '/meal-detals';
  final Function updateFavourite;
  final Function isFavouriteIndicator;
  MealDetalsScreen(this.updateFavourite, this.isFavouriteIndicator);

  @override
  _MealDetalsScreenState createState() => _MealDetalsScreenState();
}

class _MealDetalsScreenState extends State<MealDetalsScreen> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((ml) => ml.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildRapperContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(meal.ingredients[index]),
                  ),
                ),
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildRapperContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '# ${index + 1}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        meal.steps[index],
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Divider(
                      thickness: .5,
                      color: Colors.black38,
                      indent: 70,
                    )
                  ],
                ),
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.updateFavourite(id);
          });
        },
        child: Icon(
          widget.isFavouriteIndicator(id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Container buildSectionTitle(String tittle, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        tittle,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Container buildRapperContainer({ListView child}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: child,
    );
  }
}
