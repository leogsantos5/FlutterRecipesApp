import 'package:meals/models/category.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/data/dummy_data.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MealsScreen(
              title: category.title,
              category: category,
              meals: filterMealsByCategory(),
            ),
          ),
        );
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
