import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/excepsion.dart';

import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/data_sources/quote_remote_data_source.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';
import '../../../../json_reader.dart';

void main() {
  late QuoteRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = QuoteRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("getQuote test", () {
    test("should return list of News Model when the response code is 200",
        () async {
      when(mockHttpClient.get(Uri.parse('https://zenquotes.io/api/quotes')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/quote_list.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      final result = await dataSource.getQuote();
      expect(result, equals(testQuoteList));
    });

    test(
      'Should return no failure when response statuscode not 200',
      () {
        // arrange
        when(mockHttpClient.get(Uri.parse('https://zenquotes.io/api/quotes')))
            .thenAnswer((_) async => http.Response("Not Found", 404));
        // act
        final result = dataSource.getQuote();
        // asset
        expect(() => result, throwsA(isA<ServerException>()));
      },
    );
  });
}
