// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';
import 'package:news_app_/services/news_service.dart';
import 'package:news_app_/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  final String category;

  const NewsListBuilder({super.key, required this.category});
  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  List<ArticleModel> articles = [];
  var futur;

  @override
  void initState() {
    super.initState();
    futur = NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: futur,
      builder: (context, snapshot) {
        articles = snapshot.data ?? [];
        if (snapshot.hasData) {
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: snapshot.data!.length, (context, index) {
            return NewsList(articles: snapshot.data![index]);
          }));
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.warning_amber_sharp),
                  Text('Ooops there is an error :( '),
                ],
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
