import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id,
      required this.title,
      this.color = Colors.amber,
      required this.image});

  final String id;
  final String title;
  final AssetImage image;
  final Color color;
}
