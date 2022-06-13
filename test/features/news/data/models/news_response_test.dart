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
                "url":
                    "https://www.nytimes.com/live/2022/06/12/theater/tony-awards",
                "urlToImage":
                    "https://asset.kompas.com/crops/_Yhb9i0KoAf41TNs_ucSWowWZd0=/0x0:0x0/780x390/filters:watermark(data/photo/2020/03/10/5e6775b55942a.png,0,-0,1)/data/photo/2022/06/12/62a5d0698431e.jpg",
              }
            ],
          };
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
