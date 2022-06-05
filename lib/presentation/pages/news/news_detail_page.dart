import 'package:flutter/material.dart';
import 'package:orodomop_app/common/constant.dart';
import 'package:orodomop_app/domain/entities/news.dart';

import 'news_web_view.dart';

class NewsDetailPage extends StatelessWidget {
  static const route = '/News_page/detail';
  final News news;
  const NewsDetailPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'News',
            style: kHeading5.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: news.urlToImage!,
              child: Image.network(news.urlToImage!),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.description ?? "-",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    news.title!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    'Date: ${news.publishedAt}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Author: ${news.author}',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  const Divider(color: Colors.grey),
                  Text(
                    news.content ?? "-",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    child: const Text('Read more'),
                    onPressed: () {
                      Navigator.pushNamed(context, NewsWebViewPage.route,
                          arguments: news.url);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
