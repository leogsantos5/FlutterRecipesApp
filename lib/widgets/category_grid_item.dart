import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/data/dummy_data.dart';

class CategoryGridItem extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  const CategoryGridItem(
      {super.key, required this.category, required this.onToggleFavorite});
  final Category category;

  @override
  Widget build(BuildContext context) {
    List<Meal> filterMealsByCategory() {
      List<Meal> mealsOfCat = [];
      mealsOfCat = dummyMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      return mealsOfCat;
    }

    return InkWell(
      onTap: () {
        var filteredMeals = filterMealsByCategory();
        if (filteredMeals.isEmpty) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                    '${category.title} cuisine has ${filteredMeals.length} meals.'),
                content: Text(
                    'There were no ${category.title} cuisine meals found. Please try again later.'),
                actions: [
                  TextButton(
                    child: const Text('Go back.'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MealsScreen(
                title: category.title,
                meals: filterMealsByCategory(),
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        }
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: category.image,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(
                  0.4), // Adjust the opacity value (0.0 to 1.0) here
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
