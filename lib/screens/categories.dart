import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
  });
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      children: [
        ...availableCategories
            .map(
              (cat) => CategoryGridItem(
                category: cat,
                onToggleFavorite: onToggleFavorite,
              ),
            )
            .toList(),
      ],
    );
  }
}
