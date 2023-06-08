import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String? title;
  final void Function(Meal meal) onToggleFavorite;

  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Uh oh... nothing here!",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            "Try selecting a different category",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, int index) {
          if (meals.isNotEmpty) {
            return MealItem(
              meal: meals[index],
              onToggleFavorite: onToggleFavorite,
            );
          }
        },
      );
    }

    if (title == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    }
  }
}
