import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/data/models/quote_response.dart';

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
          final List<dynamic> jsonMap =
              json.decode(readJson('dummy_data/quote_list.json'));
          // act
          final result = QuoteResponse.fromJson(jsonMap);
          // asset
          expect(result, testQuoteResponseModel);
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
          final result = testQuoteResponseModel.toJson();
          // asset
          final expectedJsonMap = [
            {
              "quote":
                  "You don't need anybody to tell you who you are or what you are. You are what you are!",
              "author": "John Lennon",
            }
          ];
          expect(result, expectedJsonMap);
        },
      );
    },
  );
}
