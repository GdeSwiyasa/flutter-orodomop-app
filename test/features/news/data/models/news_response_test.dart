import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/data/models/news_response.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../json_reader.dart';

void main() {
  group(
    'fromJson test',
    () {
      test(
        'Should return a valid model from JSON',
        () {
          // arrange
          final Map<String, dynamic> jsonMap =
              json.decode(readJson('dummy_data/news_list.json'));
          // act
          final result = NewsResponse.fromJson(jsonMap);
          // asset
          expect(result, testNewsResponseModel);
        },
      );
    },
  );

  group(
    'toJson test',
    () {
      test(
        'Should return a JSON map containing proper data',
        () {
          // act
          final result = testNewsResponseModel.toJson();
          // asset
          final expectedJsonMap = {
            "articles": [
              {
                "author": "author",
                "title": "title",
                "content": "content",
                "description": "description",
                "publishedAt": "publishedAt",
                "source": {"id": "2", "name": "name"},
                "url": "url",
                "urlToImage": "urlToImage",
              }
            ],
          };
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
