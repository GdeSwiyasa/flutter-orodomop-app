import 'package:flutter_test/flutter_test.dart';

import '../../../../dummy_data/dummy_data.dart';

void main() {
  group(
    "toJson",
    () {
      test(
        "should return a JSON map containing proper data",
        () {
          final expectedMap = {
            'id': 1,
            'title': 'title',
            'contents': 'contents',
          };

          final result = testNotes.toMap();
          expect(result, expectedMap);
        },
      );
    },
  );
}
