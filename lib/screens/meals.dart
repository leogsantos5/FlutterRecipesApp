import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String title;
  final Category category;

  const MealsScreen(
      {super.key,
      required this.meals,
      required this.title,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, int index) {
          if (meals.isNotEmpty) {
            final meal = meals[index];
            return ListTile(
              leading: Image.network(meal.imageUrl),
              title:
                  Text(meal.title, style: const TextStyle(color: Colors.white)),
            );
          } else {
            return const Text(
              "Foda-se essa categoria nao tem pratos nenhuns crl",
              style: TextStyle(color: Colors.white),
            );
          }
        },
      ),
    );
  }
}
