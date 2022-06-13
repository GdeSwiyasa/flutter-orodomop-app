import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/usecases/search_news.dart';
import 'package:orodomop_app/presentation/provider/search_news_list_notifier.dart';

import '../../../../dummy_data/dummy_data.dart';
import 'search_news_list_notifier_test.mocks.dart';

@GenerateMocks([SearchNews])
void main() {
  late MockSearchNews usecase;
  late SearchNewsListNotifier provider;

  setUp(() {
    usecase = MockSearchNews();
    provider = SearchNewsListNotifier(usecase: usecase);
  });

  group('Search News List Notifier', () {
    test('initialState should be Empty', () {
      expect(provider.state, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(usecase.execute(testQuery))
          .thenAnswer((_) async => Right(testListNews));
      // act
      provider.fetchSearchNews(testQuery);
      // assert
      verify(usecase.execute(testQuery));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(usecase.execute(testQuery))
          .thenAnswer((_) async => Right(testListNews));
      // act
      provider.fetchSearchNews(testQuery);
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(usecase.execute(testQuery))
          .thenAnswer((_) async => Right(testListNews));
      // act
      await provider.fetchSearchNews(testQuery);
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.newsList, testListNews);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(usecase.execute(testQuery))
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchSearchNews(testQuery);
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
    });
  });
}
