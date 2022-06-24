import 'package:equatable/equatable.dart';
import 'package:orodomop_app/data/models/quote_model.dart';

class QuoteResponse extends Equatable {
  final List<QuoteModel> quoteList;

  const QuoteResponse({required this.quoteList});

  factory QuoteResponse.fromJson(List<dynamic> json) {
    return QuoteResponse(
      quoteList: List<QuoteModel>.from((json as List)
          .map((e) => QuoteModel.fromJson(e))
          .where((element) => element.quote != null)),
    );
  }

  List<dynamic> toJson() {
    return List<dynamic>.from(quoteList.map((x) => x.toJson()));
  }

  @override
  List<Object?> get props => [quoteList];
}
