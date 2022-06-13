import 'package:flutter/material.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/usecases/search_news.dart';

class SearchNewsListNotifier extends ChangeNotifier{
  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<News> _newsList = <News>[];
  List<News> get newsList => _newsList;

  String _message = '';
  String get message => _message;

  final SearchNews usecase;

  SearchNewsListNotifier({required this.usecase});

  Future<void> fetchSearchNews(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await usecase.execute(query);
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