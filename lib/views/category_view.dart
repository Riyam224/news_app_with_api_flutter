import 'package:flutter/material.dart';
import 'package:news_app_/widgets/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        NewsListBuilder(
          category: category,
        ),
      ],
    ));
  }
}
