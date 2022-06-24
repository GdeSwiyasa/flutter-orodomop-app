import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/domain/usecases/get_quote.dart';

import '../../../../dummy_data/dummy_data.dart';
import '../../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockQuoteRepository repository;
  late GetQuote usecase;

  setUp(() {
    repository = MockQuoteRepository();
    usecase = GetQuote(repository);
  });

  group("GetQuote test", () {
    test("should get list of News from the repository", () async {
      when(usecase.execute()).thenAnswer((_) async => Right(testQuoteList));

      final result = await usecase.execute();

      expect(result, Right(testQuoteList));
    });
  });
}
