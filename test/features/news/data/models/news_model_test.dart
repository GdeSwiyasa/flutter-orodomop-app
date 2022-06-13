import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/data/models/news_model.dart';
import 'package:orodomop_app/domain/entities/news.dart';

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
        "url": "https://www.nytimes.com/live/2022/06/12/theater/tony-awards",
        "urlToImage":
            "https://asset.kompas.com/crops/_Yhb9i0KoAf41TNs_ucSWowWZd0=/0x0:0x0/780x390/filters:watermark(data/photo/2020/03/10/5e6775b55942a.png,0,-0,1)/data/photo/2022/06/12/62a5d0698431e.jpg",
      };

      final result = testNewsModel.toJson();
      expect(result, expectedMap);
    });
  });
}
