import 'package:flutter/material.dart';
import 'package:news_app_/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 20, top: 20),
      child: Container(
        width: 150,
        height: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(category.image),
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            category.categoryName,
            style: const TextStyle(
              color: Color(0xffff9800),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
