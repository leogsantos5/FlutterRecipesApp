import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick your category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.5,
        ),
        children: const [
          Text("Texto 1", style: TextStyle(color: Colors.white)),
          Text("Texto 2", style: TextStyle(color: Colors.white)),
          Text("Texto 3", style: TextStyle(color: Colors.white)),
          Text("Texto 4", style: TextStyle(color: Colors.white)),
          Text("Texto 5", style: TextStyle(color: Colors.white)),
          Text("Texto 6", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
