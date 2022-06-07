import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/models/news_model.dart';
import 'package:orodomop_app/data/models/news_response.dart';

import '../../../../common/excepsion.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  static const apiKey = 'apiKey=6dc741d16ebd46f8b431dc375c7915be';

  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NewsModel>> getNews() async {
    final response = await client.get(
        Uri.parse('http://newsapi.org/v2/top-headlines?country=id&$apiKey'));
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body)).newsList;
    } else {
      throw ServerException();
    }
  }
}
