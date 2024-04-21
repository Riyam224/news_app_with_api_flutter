import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';
import 'package:news_app_/services/news_service.dart';
import 'package:news_app_/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  const NewsListBuilder({super.key});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  //
  List<ArticleModel> articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGeneralNews();
  }

  Future<void> getGeneralNews() async {
    articles = await NewsService(Dio()).getNews();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsList(articles: articles[index]);
        });
  }
}
