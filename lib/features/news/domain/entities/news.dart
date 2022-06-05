import 'package:equatable/equatable.dart';
import 'package:orodomop_app/features/news/domain/entities/source.dart';

class News extends Equatable {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final Source? source;

  const News({
    required this.author,
    required this.title,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.source,
    required this.url,
    required this.urlToImage,
  });

  @override
  List<Object?> get props => [
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
        source
      ];
}
