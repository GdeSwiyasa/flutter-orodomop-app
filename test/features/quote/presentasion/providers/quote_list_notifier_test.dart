import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/common/failure.dart';
import 'package:orodomop_app/common/state_enum.dart';
import 'package:orodomop_app/domain/usecases/get_quote.dart';
import 'package:orodomop_app/presentation/provider/quote_list_notifier.dart';

import '../../../../dummy_data/dummy_data.dart';
import 'quote_list_notifier_test.mocks.dart';

@GenerateMocks([GetQuote])
void main() {
  late MockGetQuote usecase;
  late QuoteListNotifier provider;

  setUp(() {
    usecase = MockGetQuote();
    provider = QuoteListNotifier(getQuote: usecase);
  });

  group('Quote List Notifier', () {
    test('initialState should be Empty', () {
      expect(provider.state, equals(RequestState.Empty));
    });

    test('should get data from the usecase', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => Right(testListNews));
      // act
      provider.fetchGetQuote();
      // assert
      verify(usecase.execute());
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => Right(testListNews));
      // act
      provider.fetchGetQuote();
      // assert
      expect(provider.state, RequestState.Loading);
    });

    test('should change movies when data is gotten successfully', () async {
      // arrange
      when(usecase.execute()).thenAnswer((_) async => Right(testListNews));
      // act
      await provider.fetchGetQuote();
      // assert
      expect(provider.state, RequestState.Loaded);
      expect(provider.quoteList, testListNews);
    });

    test('should return error when data is unsuccessful', () async {
      // arrange
      when(usecase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('Server Failure')));
      // act
      await provider.fetchGetQuote();
      // assert
      expect(provider.state, RequestState.Error);
      expect(provider.message, 'Server Failure');
    });
  });
}
