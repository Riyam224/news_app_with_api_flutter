import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_/models/article_model.dart';
import 'package:news_app_/services/news_service.dart';
import 'package:news_app_/widgets/news_list.dart';

class NewsListBuilder extends StatefulWidget {
  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  List<ArticleModel> articles = [];
  var futur;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futur = NewsService(Dio()).getNews();
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
