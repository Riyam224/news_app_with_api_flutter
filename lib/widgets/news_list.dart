import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articles});

  final ArticleModel articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          //
          Image.network(
            articles.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
          Text(
            articles.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            articles.subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
