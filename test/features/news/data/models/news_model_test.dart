import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/features/news/data/models/news_model.dart';
import 'package:orodomop_app/features/news/domain/entities/news.dart';

import '../../../../dummy_data/dummy_data.dart';

void main() {
  test("should be a subclass off entitie", () {
    expect(testNewsModel, isA<News>());
  });

  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('news.json'));

      final result = NewsModel.fromJson(jsonMap);

      expect(result, testNewsModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        "author": "author",
        "title": "title",
        "content": "content",
        "description": "description",
        "publishedAt": "publishedAt",
        "source": {"id": "2", "name": "name"},
        "url": "url",
        "urlToImage": "urlToImage"
      };

      final result = testNewsModel.toJson();
      expect(result, expectedMap);
    });
  });
}
