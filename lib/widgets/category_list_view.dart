import 'package:flutter/material.dart';
import 'package:news_app_/models/category_model.dart';
import 'package:news_app_/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
      image: 'assets/images/business.webp',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/images/entertaiment.jpg',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      image: 'assets/images/health.jpg',
      categoryName: 'Health',
    ),
    CategoryModel(
      image: 'assets/images/science.jpg',
      categoryName: 'Science',
    ),
    CategoryModel(
      image: 'assets/images/technology.jpg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      image: 'assets/images/sports.jpg',
      categoryName: 'Sports',
    ),
    CategoryModel(
      image: 'assets/images/general.jpg',
      categoryName: 'General',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
