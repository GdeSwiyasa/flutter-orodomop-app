import 'package:orodomop_app/data/models/source_model.dart';
import 'package:orodomop_app/domain/entities/news.dart';

class NewsModel extends News {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  SourceModel source;

  NewsModel({
    required this.author,
    required this.title,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.url,
    required this.urlToImage,
  }) : super(
          author: author,
          title: title,
          content: content,
          description: description,
          publishedAt: publishedAt,
          source: source,
          url: url,
          urlToImage: urlToImage,
        );

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      title: json['title'],
      content: json['content'],
      description: json['description'],
      publishedAt: json['publishedAt'],
      source: SourceModel.fromJson(json['source']),
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'content': content,
      'description': description,
      'publishedAt': publishedAt,
      'source': source.toJson(),
      'url': url,
      'urlToImage': urlToImage,
    };
  }

  News toEntitie() {
    return News(
      author: author,
      title: title,
      content: content,
      description: description,
      publishedAt: publishedAt,
      source: source.toEntitie(),
      url: url,
      urlToImage: urlToImage,
    );
  }
}
