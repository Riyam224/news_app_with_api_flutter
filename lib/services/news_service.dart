import 'package:dio/dio.dart';
import 'package:news_app_/models/article_model.dart';

class NewsService {
  // todo object
  final Dio dio;
// todo constructor
  NewsService(this.dio);

  Future<List<ArticleModel>> getNews() async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=dbbdee32c9f143bb9408f91c1d2cc578&category=sports");
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];
      List<ArticleModel> articleList = [];
      for (var article in articles) {
        if (article['urlToImage'] == null ||
            article["description"] == null ||
            article["title"] == null) {
          continue;
        } else {
          ArticleModel model = ArticleModel(
            image: article["urlToImage"],
            subTitle: article["description"],
            title: article["title"],
          );

          articleList.add(model);
        }
      }

      return articleList;
    } catch (e) {
      return [];
    }
  }
}
