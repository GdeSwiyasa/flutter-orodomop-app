import 'package:flutter/material.dart';
import 'package:orodomop_app/features/news/domain/entities/news.dart';
import 'package:orodomop_app/features/news/presentasion/pages/news_detail_page.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: news.urlToImage!,
          child: Image.network(
            news.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          news.title ?? "-",
        ),
        subtitle: Text(news.author ?? ''),
        onTap: () => Navigator.pushNamed(
          context,
          NewsDetailPage.route,
          arguments: news,
        ),
      ),
    );
  }
}
