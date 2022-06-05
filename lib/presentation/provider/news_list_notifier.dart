import 'package:flutter/material.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/features/news/domain/entities/news.dart';
import 'package:orodomop_app/features/news/domain/usecases/get_news.dart';

class NewsListNotifier extends ChangeNotifier {
  List<News> _newsList = <News>[];
  List<News> get newsList => _newsList;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  final GetNews getNews;

  NewsListNotifier({required this.getNews});

  Future<void> fetchGetNews() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getNews.execute();
    result.fold(
      (failure) {
        _state = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _state = RequestState.Loaded;
        _newsList = data;
        notifyListeners();
      },
    );
  }
}
