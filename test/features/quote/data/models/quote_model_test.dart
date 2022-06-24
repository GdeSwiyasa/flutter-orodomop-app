import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/data/models/quote_model.dart';
import 'package:orodomop_app/domain/entities/quote.dart';

import '../../../../dummy_data/dummy_data.dart';

void main() {
  test("should be a subclass off entitie", () {
    expect(testQuoteModel, isA<Quote>());
  });

  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('quote.json'));

      final result = QuoteModel.fromJson(jsonMap);
      print(result);

      expect(result, testQuoteModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        'quote':
            "You don't need anybody to tell you who you are or what you are. You are what you are!",
        'author': "John Lennon",
      };

      final result = testQuoteModel.toJson();
      expect(result, expectedMap);
    });
  });
}
