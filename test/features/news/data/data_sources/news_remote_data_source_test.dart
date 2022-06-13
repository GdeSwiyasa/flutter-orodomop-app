import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/excepsion.dart';

import 'package:http/http.dart' as http;
import 'package:orodomop_app/data/data_sources/news_remote_data_source.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';
import '../../../../json_reader.dart';

void main() {
  late NewsRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = NewsRemoteDataSourceImpl(client: mockHttpClient);
  });

  const apiKey = 'apiKey=6dc741d16ebd46f8b431dc375c7915be';
  const query = testQuery;
  const country = testCountry;

  group("searchNews", (){
    test("should return list of News Model when the response code is 200", () async{
      when(mockHttpClient.get(Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=$country&q=$query&$apiKey'
        ))).thenAnswer((_) async => http.Response(
            readJson('dummy_data/news_list.json'), 200,
            headers: {
              HttpHeaders.contentTypeHeader:
                  'application/json; charset=utf-8',
            }));
      final result = await dataSource.searchNews(query,country);
      expect(result, equals(testNewsList));
    });


    test(
      'Should return no failure when response statuscode not 200',
      () {
        // arrange
        when(mockHttpClient.get(Uri.parse(
                'http://newsapi.org/v2/top-headlines?country=$country&q=$query&$apiKey')))
            .thenAnswer((_) async => http.Response("Not Found", 404));
        // act
        final result = dataSource.searchNews(query,country);
        // asset
        expect(() => result, throwsA(isA<ServerException>()));
      },
    );
  });

  group("getNews test", () {
    test("should return list of News Model when the response code is 200",
        () async {
      when(mockHttpClient.get(Uri.parse('http://newsapi.org/v2/top-headlines?country=$country&$apiKey')))
          .thenAnswer((_) async => http.Response(
                  readJson('dummy_data/news_list.json'), 200,
                  headers: {
                    HttpHeaders.contentTypeHeader:
                        'application/json; charset=utf-8',
                  }));
      final result = await dataSource.getNews(country);
      expect(result, equals(testNewsList));
    });

    test(
      'Should return no failure when response statuscode not 200',
      () {
        // arrange
        when(mockHttpClient.get(Uri.parse(
                'http://newsapi.org/v2/top-headlines?country=$country&$apiKey')))
            .thenAnswer((_) async => http.Response("Not Found", 404));
        // act
        final result = dataSource.getNews(country);
        // asset
        expect(() => result, throwsA(isA<ServerException>()));
      },
    );
  });
}
