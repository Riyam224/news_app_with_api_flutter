import 'package:flutter/material.dart';
import 'package:news_app_/widgets/category_list_view.dart';
import 'package:news_app_/widgets/news_list_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: RichText(
                text: const TextSpan(children: [
              TextSpan(
                text: "News",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                  text: " Cloud",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ))
            ]))),
        // todo
        body: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: CategoryListView(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            NewsListBuilder()
          ],
        ));
  }
}
