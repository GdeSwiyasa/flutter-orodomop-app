import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/excepsion.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/data/repositorys/quote_repository_impl.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late QuoteRepositoryImpl repository;
  late MockQuoteRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockQuoteRemoteDataSource();
    repository = QuoteRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group("getQuote test", () {
    test(
        "should return remote data when the call to remote data source is successful",
        () async {
      when(mockRemoteDataSource.getQuote())
          .thenAnswer((_) async => testListQuoteModel);
      final result = await repository.getQuote();
      verify(mockRemoteDataSource.getQuote());
      final resultList = result.getOrElse(() => []);
      expect(resultList, testListNews);
    });

    test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockRemoteDataSource.getQuote()).thenThrow(ServerException());
      // act
      final result = await repository.getQuote();
      // assert
      verify(mockRemoteDataSource.getQuote());
      expect(result, equals(const Left(ServerFailure(''))));
    });

    test(
        'should return connection failure when the device is not connected to internet',
        () async {
      // arrange
      when(mockRemoteDataSource.getQuote())
          .thenThrow(const SocketException('Failed to connect to the network'));
      // act
      final result = await repository.getQuote();
      // assert
      verify(mockRemoteDataSource.getQuote());
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the network'))));
    });
  });
}
