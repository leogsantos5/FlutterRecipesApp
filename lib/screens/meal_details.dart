import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  const MealDetails({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                onToggleFavorite(meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Duration: ${meal.duration} min',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Complexity: ${meal.complexity.toString().split('.').last}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Affordability: ${meal.affordability.toString().split('.').last}',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.arrow_right),
                  title: Text(
                    meal.ingredients[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Steps',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: meal.steps.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(
                    meal.steps[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
