import 'dart:convert';
import 'dart:io';

import 'package:orodomop_app/data/models/news_model.dart';
import 'package:orodomop_app/data/models/news_response.dart';
import 'package:orodomop_app/data/models/source_model.dart';
import 'package:orodomop_app/domain/entities/news.dart';
import 'package:orodomop_app/domain/entities/source.dart';

import '../json_reader.dart';

const testNews = News(
  author: "author",
  title: "title",
  content: "content",
  description: "description",
  publishedAt: "publishedAt",
  source: Source(id: "2", name: 'name'),
  url: "url",
  urlToImage: "urlToImage",
);

final testNewsModel = NewsModel(
  author: 'author',
  title: 'title',
  content: 'content',
  description: 'description',
  publishedAt: 'publishedAt',
  source: SourceModel(id: "2", name: 'name'),
  url: 'url',
  urlToImage: 'urlToImage',
);

final testSourceModel = SourceModel(id: '2', name: 'name');

final testNewsResponseModel =
    NewsResponse(newsList: <NewsModel>[testNewsModel]);

final testListNewsModel = <NewsModel>[testNewsModel];

final testListNews = <News>[testNews];

final testNewsList =
    NewsResponse.fromJson(json.decode(readJson('dummy_data/news_list.json')))
        .newsList;

const testId = 1;

const testQuery = 'mentri';

const testCountry = 'id';

String jsonString(String name) =>
    File("test/dummy_data/$name").readAsStringSync();
