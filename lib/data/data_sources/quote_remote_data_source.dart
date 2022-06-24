import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/models/quote_model.dart';
import 'package:orodomop_app/data/models/quote_response.dart';

import '../../../../common/excepsion.dart';

abstract class QuoteRemoteDataSource {
  Future<List<QuoteModel>> getQuote();
}

class QuoteRemoteDataSourceImpl extends QuoteRemoteDataSource {
  final http.Client client;

  QuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<List<QuoteModel>> getQuote() async {
    final response =
        await client.get(Uri.parse('https://zenquotes.io/api/quotes'));
    if (response.statusCode == 200) {
      return QuoteResponse.fromJson(json.decode(response.body)).quoteList;
    } else {
      throw ServerException();
    }
  }
}
