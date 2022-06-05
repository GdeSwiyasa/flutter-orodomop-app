import 'package:equatable/equatable.dart';
import 'package:orodomop_app/data/models/news_model.dart';

class NewsResponse extends Equatable {
  final List<NewsModel> newsList;

  const NewsResponse({required this.newsList});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      newsList: List<NewsModel>.from((json['articles'] as List)
          .map((e) => NewsModel.fromJson(e))
          .where((element) => element.urlToImage != null)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "articles": List<dynamic>.from(newsList.map((x) => x.toJson())),
    };
  }

  @override
  List<Object?> get props => [newsList];
}
