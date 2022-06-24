import 'package:orodomop_app/domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel({required String quote, required String author})
      : super(quote: quote, author: author);
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json['a'],
      quote: json['q'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'quote': quote,
    };
  }

  Quote toEntitie() {
    return Quote(
      author: author,
      quote: quote,
    );
  }
}
