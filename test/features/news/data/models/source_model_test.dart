import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/data/models/source_model.dart';

import '../../../../dummy_data/dummy_data.dart';

void main() {
  group("fromJson", (() {
    test("should return valid model", () {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString('source.json'));

      final result = SourceModel.fromJson(jsonMap);

      expect(result, testSourceModel);
    });
  }));

  group("toJson", () {
    test("should return jsonMap", () {
      final expectedMap = {
        'id': '2',
        'name': 'name',
      };

      final result = testSourceModel.toJson();
      expect(result, expectedMap);
    });
  });
}
