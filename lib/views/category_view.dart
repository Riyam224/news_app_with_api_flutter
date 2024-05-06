import 'package:flutter/material.dart';
import 'package:news_app_/widgets/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: RichText(
                  text: const TextSpan(children: [
                TextSpan(
                  text: "News",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                    text: " Cloud",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ))
              ]))),
          body: CustomScrollView(
            slivers: [
              NewsListBuilder(
                category: category,
              ),
            ],
          )),
    );
  }
}
