import 'package:flutter/material.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/entities/quote.dart';

import '../../domain/usecases/get_quote.dart';

class QuoteListNotifier extends ChangeNotifier {
  List<Quote> _quoteList = <Quote>[];
  List<Quote> get quoteList => _quoteList;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  final GetQuote getQuote;

  QuoteListNotifier({required this.getQuote});

  Future<void> fetchGetQuote() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getQuote.execute();
    result.fold(
      (failure) {
        _state = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (data) {
        _state = RequestState.Loaded;
        _quoteList = data.cast<Quote>();
        notifyListeners();
      },
    );
  }
}
